class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.19"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.19/exangelos-0.1.19-darwin-arm64.tar.gz"
      sha256 "683f91be7ef642379643e11049986a7e5aea9798f68561518f76bf823ea7d27f"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.19/exangelos-0.1.19-darwin-x64.tar.gz"
      sha256 "82b20dbce9f9627d29275e9a35b244ea6c2f06fcb010e4eca04e9e0b670e7604"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.19/exangelos-0.1.19-linux-arm64.tar.gz"
      sha256 "ee6528089db332c483a056e41195650fb277639d1b2831afcb6620eb82a0ec3d"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.19/exangelos-0.1.19-linux-x64.tar.gz"
      sha256 "3eeb6b1ac057c6619e7ae85f2d0b46e49cb9aa58354907371c2c23ab17212481"
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
