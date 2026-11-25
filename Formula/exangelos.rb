class Exangelos < Formula
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"
  version "0.1.25"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.25/exangelos-0.1.25-darwin-arm64.tar.gz"
      sha256 "5ae4e3f2ee96b2056c0b4163ac1521a909e3d2973c54608fee1ba793e4088b20"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.25/exangelos-0.1.25-darwin-x64.tar.gz"
      sha256 "e900914c4231d76e23563d7582243fd6ef14412b0a3660e0fde314135330926e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.25/exangelos-0.1.25-linux-arm64.tar.gz"
      sha256 "0bad41d79818f38a7033a6ab9592abc479e413b45edfede138505dedf03ed82a"
    end
    on_intel do
      url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.25/exangelos-0.1.25-linux-x64.tar.gz"
      sha256 "90112aebd5a0cd2e7dcfaa255f9ac007e40ebe7b83849d718ff9753e7264d3e2"
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
