cask "exangelos-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.37"
  sha256 arm:   "c0609aad030d9c7dd3b1df34fc360c2d0bca9732b1275611690526ea161a940b",
         intel: "459d40efef562b3c23de1fb9cc1d1476687d52c6e7da530d02c07fa216f8d108"

  url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.37/Exangelos_#{version}_#{arch}.dmg"
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
