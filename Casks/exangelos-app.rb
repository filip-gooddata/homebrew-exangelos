cask "exangelos-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.43"
  sha256 arm:   "124bcedb66b985cdf90ffb58a91aaa784a303243329477d90b9b8168576c83b7",
         intel: "028ef5b563089ff25eb48b451886b76baa7148f53661293060442b1660f746d3"

  url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.43/Exangelos_#{version}_#{arch}.dmg"
  name "Exangelos"
  desc "Daemon with which agents subscribe to events from external sources"
  homepage "https://github.com/filip-gooddata/exangelos"

  depends_on formula: "filip-gooddata/exangelos/exangelos"

  app "Exangelos.app"

  caveats <<~EOS
    Exangelos.app is the menu bar tray. It uses the exangelos binary from the
    exangelos formula, which this cask installs.

    The app is signed but not notarized, so macOS blocks its first open.
    Allow it under System Settings > Privacy & Security > Open Anyway.
  EOS
end
