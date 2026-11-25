class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.21"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.21/exangelos-0.1.21-darwin-arm64.tar.gz"
      sha256 "a75f64d1ec5b724b46a12dd6fc236b5ae681a98be83188b94be368f089ddfa84"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.21/exangelos-0.1.21-darwin-x64.tar.gz"
      sha256 "7d5f8446924c459e1706e5f8c625703eef50d3d3d9b9080932eb225c279848c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.21/exangelos-0.1.21-linux-arm64.tar.gz"
      sha256 "a9105af74a3178786072421894d5112971f5335664b3922423ad0a9fba8d4df1"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.21/exangelos-0.1.21-linux-x64.tar.gz"
      sha256 "00b74e4ade04a5670b0fbb2e70bb00b4783f93323096dd91a4fd2d58c90c6012"
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
