class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.29"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.29/exangelos-0.1.29-darwin-arm64.tar.gz"
      sha256 "8491f390c00f505c003b13a772a8bdffb80cf5ba15815849b6b22987eb42006c"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.29/exangelos-0.1.29-darwin-x64.tar.gz"
      sha256 "3da38e1df185a7ad913228e742c2a7924958b0a7db05df6271f49e6f79d82e0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.29/exangelos-0.1.29-linux-arm64.tar.gz"
      sha256 "30c87c3f8e10445a916784975099469c80b866c5d24ab351ace5c218ce6aef0d"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.29/exangelos-0.1.29-linux-x64.tar.gz"
      sha256 "77475b2eb8cbdce7e914c9e1a0a99908f421ddf7d9c4d3fd7693df820fbb48b4"
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
