cask "exangelos-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.44"
  sha256 arm:   "3ed55e84134da7598f3379158d61cc41a2eda5acca0b2a1aacb5f146ce429c32",
         intel: "b406063b14cf4aef13097ce3fc6facc4a113361a4f985c05f1b8ca79c5cde870"

  url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.44/Exangelos_#{version}_#{arch}.dmg"
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
