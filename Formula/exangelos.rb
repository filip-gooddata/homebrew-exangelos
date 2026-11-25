class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.32"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.32/exangelos-0.1.32-darwin-arm64.tar.gz"
      sha256 "3e07e42832907e46d657db8e40ecc3bd1dfef02e2e825de8c6e14880eceb6276"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.32/exangelos-0.1.32-darwin-x64.tar.gz"
      sha256 "302de38ee9dc5bfd6a643d639aa6dd224c315f319e175184590fac7932075dd1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.32/exangelos-0.1.32-linux-arm64.tar.gz"
      sha256 "97eae78e6bd1baf67889fcc6a655e186d787662da81debd8e02d5f725eb9b5a4"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.32/exangelos-0.1.32-linux-x64.tar.gz"
      sha256 "914bd79d3e40a19caf9dfdf9d5f3280b2c01549f08d93f9201cf46e501c82e5f"
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
