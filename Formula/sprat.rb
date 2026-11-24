class Sprat < Formula
  desc "Product manager for every Claude Code agent on your machine"
  homepage "https://sprat.dev"
  version "0.4.4"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.4/sprat-0.4.4-macos-arm64.tar.gz"
      sha256 "80743b09fb7503b3e398e35ccfa8595ab72f458a5639d42f3da5f46a14089e38"
    end
    on_intel do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.4/sprat-0.4.4-macos-x86_64.tar.gz"
      sha256 "0bddca909f5d773634f4767f35f4370be4ab4e1aa558d066bbb9c902bf2cc3c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.4/sprat-0.4.4-linux-arm64.tar.gz"
      sha256 "7e2d39f0ed5e5535d3f72d87611b33f1b056ecfea1162751ec537851eb9bcc24"
    end
    on_intel do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.4/sprat-0.4.4-linux-x86_64.tar.gz"
      sha256 "38edfc2bc3f8ee080d2a0ae3ec81d18972a0846a400e35b591aad21e6dd68f42"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/sprat"
  end

  def caveats
    <<~EOS
      Sprat supervises Claude Code sessions; install Claude Code first.
        sprat                 open the board
        sprat serve           run Sprat in the background
        sprat install-agent   start it at login (macOS)
    EOS
  end

  test do
    assert_match "usage: sprat", shell_output("#{bin}/sprat help 2>&1", 1)
  end
end
