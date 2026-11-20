class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.10/exangelos-0.1.10-darwin-arm64.tar.gz"
      sha256 "8955a9eda4aa20fd5ab3c165e146301c6cc67538e302c0bb0deed64c50595abf"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.10/exangelos-0.1.10-darwin-x64.tar.gz"
      sha256 "2e1103cddd9f47c444e723669029875c493b94b8aab8549cb04477c2c0138159"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.10/exangelos-0.1.10-linux-arm64.tar.gz"
      sha256 "16aad364a2eb1a451f76bc969481a0f1dcbc314e5127dada916715b9dbb24fd5"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.10/exangelos-0.1.10-linux-x64.tar.gz"
      sha256 "f86f0a960b87f38051f0d45c60101f267a01a1eebaebb33dd13e5aed240a7690"
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
