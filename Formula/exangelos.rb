class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.18/exangelos-0.1.18-darwin-arm64.tar.gz"
      sha256 "44b212b0f2ca90028dc5fdda513e0a655a515ac3ccca46950b57de951807635a"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.18/exangelos-0.1.18-darwin-x64.tar.gz"
      sha256 "75cc681220fbe0ed973e12e437a50b5394546c82e2c98a9a38879d72c701744e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.18/exangelos-0.1.18-linux-arm64.tar.gz"
      sha256 "6798a348ef169da93339eb6b3b47fc948a8873ecaea12b536d8683269e8d6bbe"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.18/exangelos-0.1.18-linux-x64.tar.gz"
      sha256 "8075dea4122f349b2038b80ad1bb4ea3cadafe202fe1a10b6bd9cdcf0a95ecc6"
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
