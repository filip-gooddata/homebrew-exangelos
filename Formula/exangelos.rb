class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.2/exangelos-0.1.2-darwin-arm64.tar.gz"
      sha256 "75e9061f782be3a4aa805b795519b626df35682e0251202e5ef48dbfb00fcc1f"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.2/exangelos-0.1.2-darwin-x64.tar.gz"
      sha256 "53bbab0aad81ad2039c023601981ae7c367b4a70d0a53068bbd88fe7e3135b57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.2/exangelos-0.1.2-linux-arm64.tar.gz"
      sha256 "f2e96118b51c9d8a71e4b2b00db31b6a6c462659df82896ac17aa97d228e9cc7"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.2/exangelos-0.1.2-linux-x64.tar.gz"
      sha256 "5997de164357182d30f9528c70aed157c0f5f776f6a20c556dd07b70a3096132"
    end
  end

  def install
    bin.install "exangelos"
    bin.install_symlink "exangelos" => "xng"
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
