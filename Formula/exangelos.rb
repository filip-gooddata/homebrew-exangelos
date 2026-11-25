class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.22"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.22/exangelos-0.1.22-darwin-arm64.tar.gz"
      sha256 "1e86741d5bdb9658fdd104574625c2518057ad1b6e92b08cbbd204339476b613"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.22/exangelos-0.1.22-darwin-x64.tar.gz"
      sha256 "d9f63afd326821f5e99ce1bf6038846829fb69ca58a958272c1d39e7611280c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.22/exangelos-0.1.22-linux-arm64.tar.gz"
      sha256 "7799b5c17c00b3dd4f0d95f8fe1dcd44dfad794cc2f7e76dad2b7f4d3b772b16"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.22/exangelos-0.1.22-linux-x64.tar.gz"
      sha256 "e4cfce3b80b3d2f346c8a242af9b818ecb04d7682d2fa3d62a09966d345c7e79"
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
