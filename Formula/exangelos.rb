class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.3/exangelos-0.1.3-darwin-arm64.tar.gz"
      sha256 "e442df6b4bda1f936053e0dbd6add926ad30c80db3a204879403c6f85b45e5b7"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.3/exangelos-0.1.3-darwin-x64.tar.gz"
      sha256 "d8eeadf19201ebb94b10cffc6b7523dfbef41e180687a2a8d54be326afd2cab3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.3/exangelos-0.1.3-linux-arm64.tar.gz"
      sha256 "efc8c19ae53c8dd5eb76c6eca5a2553b4fdd88531c7711fc343368da51e9a89d"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.3/exangelos-0.1.3-linux-x64.tar.gz"
      sha256 "c9685b5cc2455ba7fb1b39902d71cfe738d1c15cb3522f5a348fbca3732b2bfa"
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
