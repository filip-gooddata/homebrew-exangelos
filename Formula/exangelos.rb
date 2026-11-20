class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.8/exangelos-0.1.8-darwin-arm64.tar.gz"
      sha256 "9f21814af1a3cf4d2117be70502640503ae4947e2e19ad72293ff76de0429f3e"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.8/exangelos-0.1.8-darwin-x64.tar.gz"
      sha256 "24d186273c7ced9b40ecbc8e3de69629d50d444d6ae1d0a624dcf777b2e45bce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.8/exangelos-0.1.8-linux-arm64.tar.gz"
      sha256 "ef51f60e73ee3cfec0ffe8aaafc88663cbb4e2cd96f82c59a7c088350b129470"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.8/exangelos-0.1.8-linux-x64.tar.gz"
      sha256 "283b92122bda3d88cdeaae6cf4292a2a9c08579c5f09e1679e3a41387595d151"
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
