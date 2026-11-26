class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.38"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.38/exangelos-0.1.38-darwin-arm64.tar.gz"
      sha256 "b06e0dfaf8abbf1f31a66deaa41bdf3735972ae8bc61d838d65334ef476c20e2"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.38/exangelos-0.1.38-darwin-x64.tar.gz"
      sha256 "a224ca96f4330239ae3cbdd4da8e8e154b82c218d124e915d2dc965abcb76921"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.38/exangelos-0.1.38-linux-arm64.tar.gz"
      sha256 "a5e5231123915b7611a8d048706d5f4cb7e5cb106552129d7fed7605ecc261de"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.38/exangelos-0.1.38-linux-x64.tar.gz"
      sha256 "c98a5db4ac5d8ccf5d03064abf416ced9060d368675c940033a9dbcb002496b4"
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
