cask "exangelos-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.32"
  sha256 arm:   "1318df354587f3afc68e495a54765bed5bda8db915f681884454dbd540b64c49",
         intel: "3b222301380a044104311779ff06fefdb88568acc974f84a9d835c834276e171"

  url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.32/Exangelos_#{version}_#{arch}.dmg"
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
