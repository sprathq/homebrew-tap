class Sprat < Formula
  desc "Product manager for every Claude Code agent on your machine"
  homepage "https://sprat.dev"
  version "0.4.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.0/sprat-0.4.0-macos-arm64.tar.gz"
      sha256 "65e9cdb5771b7a7f78b9b2d681e6430dbe1fcc8e257dde14cc46891b19e672c8"
    end
    on_intel do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.0/sprat-0.4.0-macos-x86_64.tar.gz"
      sha256 "2e96b293ba1c854c67afd78d783b05625444cb7344d11a076ce76db8325813f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.0/sprat-0.4.0-linux-arm64.tar.gz"
      sha256 "01d33c5f6ab7fbb58351a3e30636932e5a786def3641c2bc20e8c3afa8fb0b65"
    end
    on_intel do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.0/sprat-0.4.0-linux-x86_64.tar.gz"
      sha256 "015d16ae15b839ec4af45785e68bd255527fc67ccbc0ef3bff79c9c45bf0370d"
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
