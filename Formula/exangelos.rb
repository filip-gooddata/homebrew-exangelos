class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.39"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.39/exangelos-0.1.39-darwin-arm64.tar.gz"
      sha256 "daaf3f3f9a15f7d46f6c8916918a137f361a0b64411671de8b64001b3986d8f7"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.39/exangelos-0.1.39-darwin-x64.tar.gz"
      sha256 "3fd972205cb7f75e8eb02169a5ffe3e43aab290b9c2a4e861a9ae592c0ab4aa1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.39/exangelos-0.1.39-linux-arm64.tar.gz"
      sha256 "ba71d8559c16ed984003eb8b6809154887c0b44f6cb5a7d00e9943f097f594a7"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.39/exangelos-0.1.39-linux-x64.tar.gz"
      sha256 "3dee5ada30b1926c7604ca9d1177705ddf4a640588e752db3e88e61f55429d15"
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
