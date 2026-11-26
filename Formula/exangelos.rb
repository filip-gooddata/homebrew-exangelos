class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.41"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.41/exangelos-0.1.41-darwin-arm64.tar.gz"
      sha256 "5dab121174cabc610d033c85d943071d2f85ba16e96aa5e49e3789a13dd179d1"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.41/exangelos-0.1.41-darwin-x64.tar.gz"
      sha256 "cb4a97fec992eefe6877a55f144c6d39bb2f19cab05526ee067e9836780cb8cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.41/exangelos-0.1.41-linux-arm64.tar.gz"
      sha256 "b02365d101d8fa6eded67927af87c1b23a4fdee7abbb74f7086e369008bb9f0a"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.41/exangelos-0.1.41-linux-x64.tar.gz"
      sha256 "bbf37f799a8c4e6d3ca4e81ebb8cca51b09bf4f269affe38cb36a7b24b56812d"
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
