class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.27"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.27/exangelos-0.1.27-darwin-arm64.tar.gz"
      sha256 "e52c854c6493cd746239ae76ad540ef5ff498b9e19f1c58500207f63063985b3"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.27/exangelos-0.1.27-darwin-x64.tar.gz"
      sha256 "c4f4439d49f92ea85fb5bde0a11df16107ed20fd51ad407ab7f17bcbadad5f85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.27/exangelos-0.1.27-linux-arm64.tar.gz"
      sha256 "2d0d8f7519db58c4743609604de73ddae702b31ebfb48f0f8f5f93683a53c47e"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.27/exangelos-0.1.27-linux-x64.tar.gz"
      sha256 "3a8c8667bfab47c63735d613e36a7b1d73b5b8f762c9d48c8c7c166ade1f9b40"
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
