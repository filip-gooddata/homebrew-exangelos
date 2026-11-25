class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.34"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.34/exangelos-0.1.34-darwin-arm64.tar.gz"
      sha256 "19f914eda90458b252387785cb499eb902131959fa320603deccf6f9e993d9ac"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.34/exangelos-0.1.34-darwin-x64.tar.gz"
      sha256 "3759a94983a09d7731f8e2d4093347cbb330960489c3cc7191b4c013fe20f544"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.34/exangelos-0.1.34-linux-arm64.tar.gz"
      sha256 "f34409edbf533a7b21a9db97f522f7f52ab0b62fd94fb45fe222479f704f77dc"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.34/exangelos-0.1.34-linux-x64.tar.gz"
      sha256 "5c0b019a736adbd71049664c984c786a48836ffc2175e34afcf2a35c0463c83d"
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
