cask "claude-usage" do
  version "1.0.0"
  sha256 "fdd1b20ce221b066f8c776e6c7b1e9ea03a626f5df830aa16cbbd91d26912acc"

  url "https://github.com/spritrl/claude-usage/releases/download/v#{version}/ClaudeUsage.app.zip"
  name "Claude Usage"
  desc "Menu bar app showing Claude session and weekly usage in real time"
  homepage "https://github.com/spritrl/claude-usage"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "ClaudeUsage.app"

  zap trash: [
    "~/Library/Preferences/com.chris.claude-usage.plist",
  ]

  caveats do
    <<~EOS
      ClaudeUsage.app is ad-hoc signed. If macOS refuses to open it, run:
        xattr -dr com.apple.quarantine /Applications/ClaudeUsage.app
      or install with: brew install --no-quarantine spritrl/tap/claude-usage
    EOS
  end
end
