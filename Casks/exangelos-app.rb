cask "exangelos-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.35"
  sha256 arm:   "f0b441cac3cdca851d6e1f7c6b74b415877769606c004cd5f56d4adcafa9a76e",
         intel: "512c7ca93d9a11f340e6f284f0756d4f687bdb20e688a6ebb5f0939411adf413"

  url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.35/Exangelos_#{version}_#{arch}.dmg"
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
