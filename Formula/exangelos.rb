class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.20/exangelos-0.1.20-darwin-arm64.tar.gz"
      sha256 "c0c0f48b8ff220e7d682b1bd8ab420b61d968ec865d7705331ca5f50e3730e6c"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.20/exangelos-0.1.20-darwin-x64.tar.gz"
      sha256 "9b978ae2666b775ddac792e584cdf296caeffec675c64d467b6053d71814b1ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.20/exangelos-0.1.20-linux-arm64.tar.gz"
      sha256 "06bb59ca7260bb17e500dcaf6e11357fef832822731f5e04580484daddb2053a"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.20/exangelos-0.1.20-linux-x64.tar.gz"
      sha256 "408ad786355139709ba1a21e2a8bcc45818f6e2d0b198c2f27f7600107e70e0e"
    end
  end

  def install
    bin.install "exangelos"
    bin.install_symlink "exangelos" => "xng"
  end

  service do
    name macos: "exangelos.daemon", linux: "exangelos.daemon"
    run [opt_bin/"exangelos", "daemon"]
    keep_alive true
    environment_variables PATH: std_service_path_env
  end

  test do
    assert_equal "exangelos #{version}", shell_output("#{bin}/exangelos --version").strip
    assert_equal "exangelos #{version}", shell_output("#{bin}/xng --version").strip
  end
end
