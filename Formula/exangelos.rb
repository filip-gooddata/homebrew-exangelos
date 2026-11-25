class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.35"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.35/exangelos-0.1.35-darwin-arm64.tar.gz"
      sha256 "4f3f0a7b2ba8ef9ad9b8cfb13415f7c5bc05e14d37e7ac5d71092a3d608efa2b"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.35/exangelos-0.1.35-darwin-x64.tar.gz"
      sha256 "5a02d4c1c264bb64b360ef38dc499c5ecc744b5136bea09fb392c7a6f4f0d10a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.35/exangelos-0.1.35-linux-arm64.tar.gz"
      sha256 "a7b171e2539179e9bbe82653623f5b343bbd42fee474e2fb0b1edcf8eb0d49fe"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.35/exangelos-0.1.35-linux-x64.tar.gz"
      sha256 "471e7d4180c4750970af1fcce506c4172e21e8677e8ccfff08a3ba04052f838e"
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
