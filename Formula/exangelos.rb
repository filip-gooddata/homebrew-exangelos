class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.5/exangelos-0.1.5-darwin-arm64.tar.gz"
      sha256 "1e16ecbad3f3561e9507e666d028eed17ff1787ca253f41e72c1e1d5f692443b"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.5/exangelos-0.1.5-darwin-x64.tar.gz"
      sha256 "f7a19f8cdc612d5251974b590c60870e5f29c172ccc793d20d2c298c32d64137"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.5/exangelos-0.1.5-linux-arm64.tar.gz"
      sha256 "50600da342242657eb174d6c7e3d6b627bb5a5b7aa92543d5686de4985d67c57"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.5/exangelos-0.1.5-linux-x64.tar.gz"
      sha256 "d5b554269d1d6548cc34ec31cd27c67f44949cf885e8616752aa29bf0bb3d093"
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
