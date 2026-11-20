class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.9/exangelos-0.1.9-darwin-arm64.tar.gz"
      sha256 "1b3d520078abd57db969f169c1a3d0dc988f71528e6dac4e0b3184df340e8551"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.9/exangelos-0.1.9-darwin-x64.tar.gz"
      sha256 "cbde84980764cb4d8760a3c561bb3e8c8c6770c91374c9c2f73efe751da32791"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.9/exangelos-0.1.9-linux-arm64.tar.gz"
      sha256 "a4676d236442c355ec5f3c5fb949c301284407fbbc2cab5cd70b48de40395812"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.9/exangelos-0.1.9-linux-x64.tar.gz"
      sha256 "655c8ff5d456c9c647adebc0a7c8cd0ffbf7529bc364080d4443442522ec3456"
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
