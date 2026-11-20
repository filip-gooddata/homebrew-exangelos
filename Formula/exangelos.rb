class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.7/exangelos-0.1.7-darwin-arm64.tar.gz"
      sha256 "d28e9914dbb18c69e5a8ed4fe5d0abe867f289da95524770989053ef5ad2a4c2"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.7/exangelos-0.1.7-darwin-x64.tar.gz"
      sha256 "470392d4dd5b62bd4efd0d980ad13af098e520565e1805c2af69891dfc3bad35"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.7/exangelos-0.1.7-linux-arm64.tar.gz"
      sha256 "92f9bbd7fafa5bc785220e37ec6eb74af4a69713f9a0d3743d358d46099388a0"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.7/exangelos-0.1.7-linux-x64.tar.gz"
      sha256 "ba2e5eb82ddfac5c6604de9e98e7dcef110c834bd17bd5fd50458c3b21ff90d1"
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
