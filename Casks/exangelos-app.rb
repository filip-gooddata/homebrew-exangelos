cask "exangelos-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.46"
  sha256 arm:   "28365afbd981645fd57232ff38ad781a16b2585724005777d3f767ceefc287e8",
         intel: "68813d2b7ec94ba5dd6b880b4f5c67610a4fbbc5ef1a2efab94f0124a593c4ae"

  url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.46/Exangelos_#{version}_#{arch}.dmg"
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
