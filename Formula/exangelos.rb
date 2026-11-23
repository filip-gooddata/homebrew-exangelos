class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.12/exangelos-0.1.12-darwin-arm64.tar.gz"
      sha256 "fab4267e9bc694e4f3e8c12cbb47e05e8e8e8e0e263a11b23118f9d30f4a47bb"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.12/exangelos-0.1.12-darwin-x64.tar.gz"
      sha256 "dada3fe8d359efbdab3f1b3a7623d3e48f814e3e2b5541e25cc2734218fe7b63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.12/exangelos-0.1.12-linux-arm64.tar.gz"
      sha256 "486705c8ae3ec4fafb8e6026c55e0729c0258838673e41b46afd386650cfa890"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.12/exangelos-0.1.12-linux-x64.tar.gz"
      sha256 "2bd32fed849ecb0082602ddc6bc408c9a070a70289ddad319c9e2d1ad4d971cf"
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
