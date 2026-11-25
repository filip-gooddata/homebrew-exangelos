class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.33"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.33/exangelos-0.1.33-darwin-arm64.tar.gz"
      sha256 "a1096c9daf8e6a70d8ca6254412b1e6ca99f736aa373387efc8e662e93b6c4ff"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.33/exangelos-0.1.33-darwin-x64.tar.gz"
      sha256 "272c913d7ea03216126e479412c9e05c0f73acb5faa65f6d4a520fd65c15f39d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.33/exangelos-0.1.33-linux-arm64.tar.gz"
      sha256 "a7839a9a2a69e3c058efd50067d61ab4449cf5c17c5f02c1b2bf5695a89c52d3"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.33/exangelos-0.1.33-linux-x64.tar.gz"
      sha256 "45ad1a62ab1c64f4b6f761659f8b61b63879ba41252cedad60fb1e017edfc41e"
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
