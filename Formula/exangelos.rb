class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.28"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.28/exangelos-0.1.28-darwin-arm64.tar.gz"
      sha256 "b2feb7d10135bb38bec69f5a86150e69ecb0d27d0e03df76e0e98201b732936f"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.28/exangelos-0.1.28-darwin-x64.tar.gz"
      sha256 "963ea0fb3d020ce2dc1cecdaaa2276732ba4d96b9242072bfe6f7358504c71dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.28/exangelos-0.1.28-linux-arm64.tar.gz"
      sha256 "ce53ba692c2cf1597a67268a6a0d945c48201a3289a6797d04480a7907c18b62"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.28/exangelos-0.1.28-linux-x64.tar.gz"
      sha256 "2e9b374449664852cd4ee9eb9e96a2e4da4858a33c984eea94034e956b84265c"
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
