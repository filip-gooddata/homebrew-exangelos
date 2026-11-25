class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.37"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.37/exangelos-0.1.37-darwin-arm64.tar.gz"
      sha256 "d25d6320729d328a6351f5901e19b4e18f99530a68b1fe8ea26755ca794c8bea"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.37/exangelos-0.1.37-darwin-x64.tar.gz"
      sha256 "9cbafb91436592772f300ce6009f2a53645ad196009ac447f9c77bac512bc556"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.37/exangelos-0.1.37-linux-arm64.tar.gz"
      sha256 "baa39c4b0135b4047f7a18fe8796b31d7b0ea5388b81baf304ff29ec5471d681"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.37/exangelos-0.1.37-linux-x64.tar.gz"
      sha256 "96e4b22cb8fbafe2b97b4b75653e945e9ae7456070c88145ecef5bde82da88c0"
    end
  end

  def install
    bin.install "exangelos"
    bin.install_symlink "exangelos" => "xng"
  end

  def caveats
    <<~EOS
      To teach Claude Code and Codex to use Exangelos, run:
        exangelos skill install
      Rerun it after each upgrade to update the skill.
    EOS
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
