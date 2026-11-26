cask "exangelos-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.39"
  sha256 arm:   "0aaae10847f547e78c0b106a9edc009f68bbd1e93d7cdf39469408c70c15485e",
         intel: "fb664f8bef628322eba0820fa8f5100211ee2fe8f0ee4896721d4637f50a43a1"

  url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.39/Exangelos_#{version}_#{arch}.dmg"
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
