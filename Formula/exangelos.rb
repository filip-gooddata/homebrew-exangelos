class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.15/exangelos-0.1.15-darwin-arm64.tar.gz"
      sha256 "04ebf2cdc766cdd1dc610a39fa1272bd38cd6f14e2c2725587eaf1771eaefefb"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.15/exangelos-0.1.15-darwin-x64.tar.gz"
      sha256 "c709658abb91e4c68b82d33789ff0427733a2e291c2668c25dc9c419d6e799a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.15/exangelos-0.1.15-linux-arm64.tar.gz"
      sha256 "d17223a7a124f7dc7d7fabe5977f88128dc588673f39e0ab213967f7821951da"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.15/exangelos-0.1.15-linux-x64.tar.gz"
      sha256 "1ba45bd0d47aa075614bbb4d61827b101126ed6721cf3fbb34e487603bb51e24"
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
