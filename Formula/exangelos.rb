class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.30"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.30/exangelos-0.1.30-darwin-arm64.tar.gz"
      sha256 "c3780edde17a96ecf88f1f22891a1910b2e2b40b593b7be7d1a3adc0cd89dff1"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.30/exangelos-0.1.30-darwin-x64.tar.gz"
      sha256 "48ba1fffd896ecb0c505102092dbd09a7552caa73a2e4348840c4611690a332f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.30/exangelos-0.1.30-linux-arm64.tar.gz"
      sha256 "0276297b9c5fac105a68e157e21fa7f59926f42b8d5a6ebb80a611bc4e052557"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.30/exangelos-0.1.30-linux-x64.tar.gz"
      sha256 "ee6b0a19ecd1cd4969619037dd164a9c9fba4ec0802d29fb3dcd4e4466cefc97"
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
