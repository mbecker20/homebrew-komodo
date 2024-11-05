class Periphery < Formula
  desc "Agent to connect with Komodo Core"
  homepage "https://komo.do"
  url "https://github.com/mbecker20/homebrew-komodo/releases/download/v1.16.9/periphery.tar.gz"
  sha256 "70b307d7d41a799cad9510ef13e3daf149892739b876e86b8806bfbbbd3040fe"
  license "GPL-V3.0"

  def install
    bin.install "periphery"
    (etc/"komodo").install "periphery.config.toml"
    (var/"komodo").mkpath
    (var/"log/komodo").mkpath
  end

  # Define a launchd service block
  service do
    run ["/bin/sh", "-c", "PATH=$PATH:/usr/local/bin #{opt_bin}/periphery --config-path #{etc}/komodo/periphery.config.toml"]
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
