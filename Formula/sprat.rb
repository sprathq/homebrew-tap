class Sprat < Formula
  desc "Product manager for every Claude Code agent on your machine"
  homepage "https://sprat.dev"
  version "0.4.7"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.7/sprat-0.4.7-macos-arm64.tar.gz"
      sha256 "4dd7d911c751546533dadb2b680fa3257079426388e026adf0d89f6492485a07"
    end
    on_intel do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.7/sprat-0.4.7-macos-x86_64.tar.gz"
      sha256 "5d0f72c7f3f96a06d9db3fac0eceb4087a39ebb3441ce86a5499ef4fdf891289"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.7/sprat-0.4.7-linux-arm64.tar.gz"
      sha256 "55fc244310cfd92be8a92deb7b0bad373f270a6928c317c6d970a114ab4315d9"
    end
    on_intel do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.7/sprat-0.4.7-linux-x86_64.tar.gz"
      sha256 "33fedf44f1bcf870b485874f98180019a77ade53e6d9ac18bb2e1e4fb8402ed5"
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
