class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.11/exangelos-0.1.11-darwin-arm64.tar.gz"
      sha256 "08dd27dc964d5013c46a29efb1cc70a5eb19c5f11e03bb6900466484faa92eca"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.11/exangelos-0.1.11-darwin-x64.tar.gz"
      sha256 "aab4b03510942a4d4cdc657e33d04d940bcef0b8fb36240b0b509ff774d8d097"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.11/exangelos-0.1.11-linux-arm64.tar.gz"
      sha256 "1515b3bec0ee180d9de82fc33f0701058a706c5b4aa830a06a16e22a42f65b13"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.11/exangelos-0.1.11-linux-x64.tar.gz"
      sha256 "c0d6065176967983fe52331ad7b60cd5ed0bb0ece0fd3de89ded671f5c3e7ed8"
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
