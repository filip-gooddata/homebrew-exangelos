cask "exangelos-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.33"
  sha256 arm:   "bf8498775a9da7393e317a4fa88b091dc2225a3e23d4a3238610a9d55ec1f5c4",
         intel: "c34eb991f96898fa0da3a9308f2c41b4117c009626c51f65e8016110b0c81a4f"

  url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.33/Exangelos_#{version}_#{arch}.dmg"
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
