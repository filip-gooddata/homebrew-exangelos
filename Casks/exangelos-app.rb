cask "exangelos-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.38"
  sha256 arm:   "3a1aa0574403425fb35a8e6afe079db98c074ba1cf53ce7e9887eb734baed516",
         intel: "01207b40e67e649850fff5a7561b7f746947b215cd3449a2e8852e8e94b94745"

  url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.38/Exangelos_#{version}_#{arch}.dmg"
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
