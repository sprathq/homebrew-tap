class Sprat < Formula
  desc "Product manager for every Claude Code agent on your machine"
  homepage "https://sprat.dev"
  version "0.4.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.1/sprat-0.4.1-macos-arm64.tar.gz"
      sha256 "b73bf88271088294c71f21e2472b609cddcb186957f2d7893acf944248d0a186"
    end
    on_intel do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.1/sprat-0.4.1-macos-x86_64.tar.gz"
      sha256 "e304ba8300c2f5107e732532cdc63fec12e50442e11f8f3af9d526966b7040d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.1/sprat-0.4.1-linux-arm64.tar.gz"
      sha256 "0893456dbdbbd8f24655dbc422952d37c156a0c07f503976aa5219438f9ff52c"
    end
    on_intel do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.1/sprat-0.4.1-linux-x86_64.tar.gz"
      sha256 "b3354adc80086e8b9cab03b87494f42ce1cee5b0df32a2f664e5213e70dbc707"
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
