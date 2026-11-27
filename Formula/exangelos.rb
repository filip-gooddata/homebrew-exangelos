class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.45"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.45/exangelos-0.1.45-darwin-arm64.tar.gz"
      sha256 "b33f6d084033146a5aabe53b0d4ef8e217c8f44c7b52fa40f19749d34e2d9a97"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.45/exangelos-0.1.45-darwin-x64.tar.gz"
      sha256 "35e1c8530d310e1565c00d42c4945ab9bdd8ee2340f138eb784686bcbd3d81b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.45/exangelos-0.1.45-linux-arm64.tar.gz"
      sha256 "eefe60402d75c2aca4fef7594e16b97b28674477c03847d43ce46fe5e4b2eefa"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.45/exangelos-0.1.45-linux-x64.tar.gz"
      sha256 "00bf914f7e11124635e7459fc3bc79036d2ffd820b9aee7d4172611b01134f88"
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
