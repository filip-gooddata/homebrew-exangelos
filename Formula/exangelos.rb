class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.14/exangelos-0.1.14-darwin-arm64.tar.gz"
      sha256 "0f89cb481605c99edddee6ea4a873a5be06cef8070fadab7a592d5c60fb3e5a7"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.14/exangelos-0.1.14-darwin-x64.tar.gz"
      sha256 "7606cb2c2d05f879a465ffb8f3f3f90765d15b9385374fc3ac85cfa2e14e1b28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.14/exangelos-0.1.14-linux-arm64.tar.gz"
      sha256 "99f49e33b236b8cfaa23bd726dadcbdee65bac0ced100a939ddbe66892d2ec9a"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.14/exangelos-0.1.14-linux-x64.tar.gz"
      sha256 "50e5b5d19814abaf785a567ca80c5a36a01144cdcc7be77db3d37cf90a068914"
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
