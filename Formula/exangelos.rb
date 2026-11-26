class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.42"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.42/exangelos-0.1.42-darwin-arm64.tar.gz"
      sha256 "7494d8b039417bdaa33c4560f328adf9108b9edee40635d283b72e44ab91b4e5"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.42/exangelos-0.1.42-darwin-x64.tar.gz"
      sha256 "5401346d156bac44d4b6484b7de752a4105ae55128a177b870ecde02fbbc7281"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.42/exangelos-0.1.42-linux-arm64.tar.gz"
      sha256 "efca50708314b7ec922e85727b1314ecbe7faf076e5d7300de06a5290f401026"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.42/exangelos-0.1.42-linux-x64.tar.gz"
      sha256 "b83f014b86ac45eb2407415529c125599873cd7ba27292dbf37b87fb569f1553"
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
