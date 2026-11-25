class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.23"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.23/exangelos-0.1.23-darwin-arm64.tar.gz"
      sha256 "07aeecd2ecba1590028def2076f5db5da6a4fcdc295b071eec7831b235a252a9"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.23/exangelos-0.1.23-darwin-x64.tar.gz"
      sha256 "0a0a7caf187ac962906725ee0c3b84e7951521373ca51523ed5145d3b1a34979"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.23/exangelos-0.1.23-linux-arm64.tar.gz"
      sha256 "ec2bc0b297fdf48368d516f0a8d4269fbaa8dace23108a7821a7c94aaeefc266"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.23/exangelos-0.1.23-linux-x64.tar.gz"
      sha256 "bb73c5c9cd79034e58ed27184c1dcd0716b675e20c241ff74f0cc2d2d7ecb9eb"
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
