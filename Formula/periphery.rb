class Periphery < Formula
  desc "Agent to connect with Komodo Core"
  homepage "https://komo.do"
  url "https://github.com/mbecker20/homebrew-komodo/releases/download/v1.16.6/periphery-1.16.6.tar.gz"
  sha256 "558bbc63b06b67018c2489ec11e86ec4c88363cca8ddd2cfb31f0d387e87462a"
  license "MIT"  # Replace with your project's license

  def install
    bin.install "periphery"
    (etc/"komodo").install "periphery.config.toml"
  end

  # Define a launchd service block
  service do
    run ["/bin/sh", "-c", "export PATH=$PATH:/usr/local/bin && #{opt_bin}/periphery --config-path #{etc}/komodo/periphery.config.toml"]
    keep_alive true
    working_dir var/"komodo"
    log_path var/"log/komodo.log"
    error_log_path var/"log/komodo-error.log"
  end

  test do
    # Test the installation
    system "#{bin}/periphery", "--version"
  end
end
