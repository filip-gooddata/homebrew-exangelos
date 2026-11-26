class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.44"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.44/exangelos-0.1.44-darwin-arm64.tar.gz"
      sha256 "aef63fadd106b4cc20b15c576c6c301e784778bbfced03936da9cd11c4ed67fd"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.44/exangelos-0.1.44-darwin-x64.tar.gz"
      sha256 "7ce43ebe7b8c5a4484e4399c017cece9af4fbcec60ad81ee89e94582e5355ca9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.44/exangelos-0.1.44-linux-arm64.tar.gz"
      sha256 "d474e6474669fcc1711bbc487cac3f326c65166a9348f7e6603b5b82457a6a4e"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.44/exangelos-0.1.44-linux-x64.tar.gz"
      sha256 "7b182c1d822162fd008eef84a39853f6b5fc45095736697165a253b9b5c8059f"
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
