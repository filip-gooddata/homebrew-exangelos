class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.43"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.43/exangelos-0.1.43-darwin-arm64.tar.gz"
      sha256 "872f40e573194e0873500c3ac42b90ad3c1c6bce7aa10dc9757e5cd5b419e58b"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.43/exangelos-0.1.43-darwin-x64.tar.gz"
      sha256 "fec91a557faf9a1f4491351614c0ee30424de98bef4f024e4babba4d2e06a1c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.43/exangelos-0.1.43-linux-arm64.tar.gz"
      sha256 "9987ca11da23ab3721507ba86f16556e74b36a2a406307fbf7ad8b4941467822"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.43/exangelos-0.1.43-linux-x64.tar.gz"
      sha256 "00cac02b7c70204a8498b471149710b6f17279c450ce4d6d4032c8e4b0af1ba6"
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
