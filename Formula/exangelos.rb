class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.40"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.40/exangelos-0.1.40-darwin-arm64.tar.gz"
      sha256 "5660ca7ceb82b6353ed42596f0860eab9417281dcb1ded8375754f4447c47655"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.40/exangelos-0.1.40-darwin-x64.tar.gz"
      sha256 "0751dbae14d382594a21b5fc05a8e650c1b3f9e702ce8b864211866000583d36"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.40/exangelos-0.1.40-linux-arm64.tar.gz"
      sha256 "5647400f8e0ea2159eee6f483e35863f143e6365d799d5722f78972cbf11c5e8"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.40/exangelos-0.1.40-linux-x64.tar.gz"
      sha256 "ecd91b99a5781bc062230c12e13260cbe706b13d957504d24d92b0ee3f11aa98"
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
