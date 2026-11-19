class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.4/exangelos-0.1.4-darwin-arm64.tar.gz"
      sha256 "158e5e752b7e51b027a99223dada969bb548e37ef6ce0abafb3300c0fff1cb23"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.4/exangelos-0.1.4-darwin-x64.tar.gz"
      sha256 "78ff550a716470a741d5b4423e94725080e28d08a2c0d277af2838d0c12ee952"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.4/exangelos-0.1.4-linux-arm64.tar.gz"
      sha256 "e6071bd86b6776674473680c0de31f14060320991a3a7029e6a3e434ab2e99fa"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.4/exangelos-0.1.4-linux-x64.tar.gz"
      sha256 "d117f68fe4cb911d0da494074f3107d85ce5fcc3b6297777ff81c27287f9177e"
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
