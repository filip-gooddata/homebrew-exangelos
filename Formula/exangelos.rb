class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.46"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.46/exangelos-0.1.46-darwin-arm64.tar.gz"
      sha256 "e1bf37e5d074b246a880bbd97a89914e87ea79670b8d4ef8a138b70d45482157"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.46/exangelos-0.1.46-darwin-x64.tar.gz"
      sha256 "adfd6eb1648cf42a1e266d7f4473da61cb01d8b63ae2b811c9521978a736a1e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.46/exangelos-0.1.46-linux-arm64.tar.gz"
      sha256 "d8c48b2d6ed29bdb7d325220b2b8b098395c614220be1f5d18364070172af50c"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.46/exangelos-0.1.46-linux-x64.tar.gz"
      sha256 "577af98ad4bb787511a79c8f676ca727e08a40253f6353de8281c2dc496e3343"
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
