class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.16/exangelos-0.1.16-darwin-arm64.tar.gz"
      sha256 "9e4e71013262331dac81880f12f977482e45d5b519aa48da25c72b5a0c90cfd4"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.16/exangelos-0.1.16-darwin-x64.tar.gz"
      sha256 "647efff153fb4d134e7860a6a6b8f3f42c0e50a3ef921502d110e947831828dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.16/exangelos-0.1.16-linux-arm64.tar.gz"
      sha256 "3f6f56167cdac262af978fbec2bba9ebe762d2a25e4d2e55668413e8ecfbee55"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.16/exangelos-0.1.16-linux-x64.tar.gz"
      sha256 "b4aa5ba7242a539247797e6c953c30872e993bb4574c4e84bce4f767332a522e"
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
