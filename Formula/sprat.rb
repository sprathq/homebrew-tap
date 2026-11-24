class Sprat < Formula
  desc "Product manager for every Claude Code agent on your machine"
  homepage "https://sprat.dev"
  version "0.4.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.2/sprat-0.4.2-macos-arm64.tar.gz"
      sha256 "e1033c8080e51b1eca9ba7e04d7ae83da893349f054cac2ef660d18757ef5a4a"
    end
    on_intel do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.2/sprat-0.4.2-macos-x86_64.tar.gz"
      sha256 "0319b93a4f1f2fd50737c8daba82de39ebc4699fa15beb7a86ebf6d03337e230"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.2/sprat-0.4.2-linux-arm64.tar.gz"
      sha256 "4e07fbfb610b9576ba786beebf8e261f9dccd6ebc9954bffb280ce4c88c327cc"
    end
    on_intel do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.2/sprat-0.4.2-linux-x86_64.tar.gz"
      sha256 "033692b53eedb8558f3b202700a062c6975b6bc3632f3ef6be252998bc313369"
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
