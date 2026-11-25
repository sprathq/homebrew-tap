class Sprat < Formula
  desc "Product manager for every Claude Code agent on your machine"
  homepage "https://sprat.dev"
  version "0.4.8"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.8/sprat-0.4.8-macos-arm64.tar.gz"
      sha256 "270b1413d30e98f2706035a5800a0e087f47936e0db2505a896f2fa41b564959"
    end
    on_intel do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.8/sprat-0.4.8-macos-x86_64.tar.gz"
      sha256 "36ee3113212ec5c8e10c4e237c3c99f15765b8f1a71b17ab983d2853e933168d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.8/sprat-0.4.8-linux-arm64.tar.gz"
      sha256 "bdfbdb51c2e2b92084d4ad1cc55c14b88e02ad0105add71473c8a1c97068944c"
    end
    on_intel do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.8/sprat-0.4.8-linux-x86_64.tar.gz"
      sha256 "4e6f7463b8616c9f6dc76bb01aaebab3cd080cf418d911b35edd0a356d860215"
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
