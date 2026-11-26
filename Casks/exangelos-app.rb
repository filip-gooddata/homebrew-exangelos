cask "exangelos-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.42"
  sha256 arm:   "94798f61bb3ae3814c7380c2dc222d2008e8ac9cfbd68dfa0427f490e5e636af",
         intel: "f145924f43b1e6708d44eadd9ce5d38cdd89502d68e7769835c99085f64d2ae9"

  url "https://github.com/filip-gooddata/exangelos/releases/download/v0.1.42/Exangelos_#{version}_#{arch}.dmg"
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
