cask "exangelos-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.34"
  sha256 arm:   "b418955cd6836db726df8077bb7c451aa9d273d23de3a947240c9dc8a242f828",
         intel: "70d64aa58f5283e6036ac3bf591892ddecfa819d1587b134a58edf795eb0b010"

  url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.34/Exangelos_#{version}_#{arch}.dmg"
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
