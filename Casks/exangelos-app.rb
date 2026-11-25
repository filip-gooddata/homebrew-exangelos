cask "exangelos-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.31"
  sha256 arm:   "a41c964736c89dc89fd236d15195f33251defd5b599d7c1843e9c45d90dbc2c9",
         intel: "8475eee61e0801cfb226ad785462fc8cbe77ac369981b4ce1e0fac4fdfb64608"

  url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.31/Exangelos_#{version}_#{arch}.dmg"
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
