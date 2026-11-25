cask "exangelos-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.36"
  sha256 arm:   "08781ac077f1bf1328e796694c5f5218f727442966fdbd3e1f5d603ef129de30",
         intel: "caffe118abf27a994664caa048711187b2ebf9035abff4e9d8721e6fa857b772"

  url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.36/Exangelos_#{version}_#{arch}.dmg"
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
