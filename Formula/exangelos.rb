class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.17/exangelos-0.1.17-darwin-arm64.tar.gz"
      sha256 "269ea73adef547960d3c760db5fded4ad236e2b72af2bbef67d03d0bcef9368a"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.17/exangelos-0.1.17-darwin-x64.tar.gz"
      sha256 "c538ec3e841efba997fe82af83a12c004616c86e6d380ca70e8b66d2454cc69d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.17/exangelos-0.1.17-linux-arm64.tar.gz"
      sha256 "55da11e87707015bfd736d0ffb72778e1c78bdd775952ec85bdf6ace82be464c"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.17/exangelos-0.1.17-linux-x64.tar.gz"
      sha256 "94a2d8ce9204e4ef8a943a705605116931aedb083d526e4588e1acff8d385802"
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
