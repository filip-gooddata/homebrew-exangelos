class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.26"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.26/exangelos-0.1.26-darwin-arm64.tar.gz"
      sha256 "47601bc2f78761fb80674d94c58b12661a5d98ad5fe6446d0db095c722e29c56"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.26/exangelos-0.1.26-darwin-x64.tar.gz"
      sha256 "c20254c0d4028980121a96ec102e193e5d5c403b95af9a57556166d92db48d3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.26/exangelos-0.1.26-linux-arm64.tar.gz"
      sha256 "ddd6cb08a90d8af5fe15da4e24003dbd46637179c99d77f4c3867bd7b11418ff"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.26/exangelos-0.1.26-linux-x64.tar.gz"
      sha256 "ba39d7a70450386a15fb70a431fa5460665c0e3c4d7eb89d9161cb61e1d2e07f"
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
