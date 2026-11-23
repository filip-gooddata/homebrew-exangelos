class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.13/exangelos-0.1.13-darwin-arm64.tar.gz"
      sha256 "92595ebfc63fcca299cc2b4fae933861dc6a88fda200a06b1cb5c82d5279cba0"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.13/exangelos-0.1.13-darwin-x64.tar.gz"
      sha256 "e6a2b6e37512055ec360a724ab696d773aa88908e35cd2f957c01a88236b1051"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.13/exangelos-0.1.13-linux-arm64.tar.gz"
      sha256 "83e6536606b1e2ea8fc27bd6461b5c0a83ee5785e3668b18ba9a10794faa7354"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.13/exangelos-0.1.13-linux-x64.tar.gz"
      sha256 "1954d32d132a2bcbf65ed3e299af37924bffd8f23306104b986c01a9af66300c"
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
