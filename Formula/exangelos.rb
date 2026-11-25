class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.36"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.36/exangelos-0.1.36-darwin-arm64.tar.gz"
      sha256 "fcf99a18bfc208530d2abba463b6777e5c8f341a78fe28e08070fe115ded6447"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.36/exangelos-0.1.36-darwin-x64.tar.gz"
      sha256 "82b7da0895401fc70bd3ba8121996727d4fbb0ef3d122f7fc349c1dc5a03bb97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.36/exangelos-0.1.36-linux-arm64.tar.gz"
      sha256 "5a60bc1c7a727252d1b30fd57348a9b45ba0a713860e632936800304e409acbd"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.36/exangelos-0.1.36-linux-x64.tar.gz"
      sha256 "7533daa2069c37aa3c467a48cc1ee7e8faa7f7ff5a4a11b89b2bca170ff18f6c"
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
