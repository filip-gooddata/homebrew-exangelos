cask "exangelos-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.40"
  sha256 arm:   "d9215fdf28e516d33a793c137a4b387a439b24c4fc609b6a3b27c7c6c7850515",
         intel: "5f7dcf00a477f249c5629bdd74df30d70ce1095917884d84a4f4b6b2938ef9bb"

  url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.40/Exangelos_#{version}_#{arch}.dmg"
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
