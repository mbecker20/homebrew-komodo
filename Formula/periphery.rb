class Periphery < Formula
  desc "Agent to connect with Komodo Core"
  homepage "https://komo.do"
  url "https://github.com/mbecker20/homebrew-komodo/releases/download/v1.16.6/periphery-1.16.7.tar.gz"
  sha256 "0fd2af9abf8346f4e2283b7f8e9d35886b3ce6050a98e4b4d5799f9054c76feb"
  license "MIT"  # Replace with your project's license

  def install
    bin.install "periphery"
    (etc/"komodo").install "periphery.config.toml"
    (var/"komodo").mkpath
  end

  # Define a launchd service block
  service do
    run ["/bin/sh", "-c", "export PATH=$PATH:/usr/local/bin && #{opt_bin}/periphery --config-path #{etc}/komodo/periphery.config.toml"]
    keep_alive true
    working_dir var/"komodo"
    log_path var/"log/komodo/periphery.log"
    error_log_path var/"log/komodo/periphery-error.log"
  end

  test do
    # Test the installation
    system "#{bin}/periphery", "--version"
  end
end
