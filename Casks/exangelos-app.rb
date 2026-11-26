cask "exangelos-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.41"
  sha256 arm:   "3aa9980c44632f7054fef1a5fbfef05b8f8906b305af051f14b20852801f4ddd",
         intel: "51ca523ff2acb090e7be23127955c1efa7e62b3330164796c2351c1af66b7585"

  url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.41/Exangelos_#{version}_#{arch}.dmg"
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
