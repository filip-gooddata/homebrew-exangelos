class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.6/exangelos-0.1.6-darwin-arm64.tar.gz"
      sha256 "e848a3dafd19600a3ddbd293230d8823ec850201ea41ccd5bed9f7653014fa1f"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.6/exangelos-0.1.6-darwin-x64.tar.gz"
      sha256 "c0b083c5a30f745d4b4562e3d56f4e01d3f3563863e48097be70ed255d15922d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.6/exangelos-0.1.6-linux-arm64.tar.gz"
      sha256 "1d21839570ae3fee7ed81dd380e35155542ad2c0de1d8cf1a08aab69da00037a"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.6/exangelos-0.1.6-linux-x64.tar.gz"
      sha256 "a3cff7a7f251c4abbc56dd8a2d77dc7ee2a1b57fa18ecfc06c8c261747cc2b9b"
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
