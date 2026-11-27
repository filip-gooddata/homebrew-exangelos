cask "exangelos-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.45"
  sha256 arm:   "cf9d002d68b4d93e5b409843650e581f7a4899ae6faebbeafcdf79c85a594cb0",
         intel: "3bab8b6177f6e96e4c40ebf3ca2c0b34a22a0d4398b567ed10ee126a4ec0c058"

  url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.45/Exangelos_#{version}_#{arch}.dmg"
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
