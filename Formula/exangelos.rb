class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.31"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.31/exangelos-0.1.31-darwin-arm64.tar.gz"
      sha256 "1532fdeee448a8eeb6704b1f626476a67690b371e4b268b48706be2fbc5e5cd5"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.31/exangelos-0.1.31-darwin-x64.tar.gz"
      sha256 "9112d9515f18278eb2c7a26242590c378f432a6c88b2bbfebb40757c71191295"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.31/exangelos-0.1.31-linux-arm64.tar.gz"
      sha256 "f20eab790351fd42eb8724c919ea83cd1010e49ddf324cae3208698b0eec948f"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.31/exangelos-0.1.31-linux-x64.tar.gz"
      sha256 "f3f0c7e8e5b269b239b19ea83903e2121a1ebda162ccd543b8562bf5d32d3b2b"
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
