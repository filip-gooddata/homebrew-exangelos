class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.24"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.24/exangelos-0.1.24-darwin-arm64.tar.gz"
      sha256 "cb2b08e70e625324e83fa8205ac99eb7cd948137a122a81cab48aceb30d78e14"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.24/exangelos-0.1.24-darwin-x64.tar.gz"
      sha256 "d2cc260280d10ad41b876ab638e5de7883ceefdb105345029a62544bf814c13b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.24/exangelos-0.1.24-linux-arm64.tar.gz"
      sha256 "fdbeecce39f33aa41c87a37e4c90a287527c05713438ab1624626d05a43e46e4"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.24/exangelos-0.1.24-linux-x64.tar.gz"
      sha256 "c8263fb0bd272356b3ebc165589d5e1e55c148b2f9744638b76a130fbef24fb8"
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
