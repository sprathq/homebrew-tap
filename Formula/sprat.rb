class Sprat < Formula
  desc "Product manager for every Claude Code agent on your machine"
  homepage "https://sprat.dev"
  version "0.4.5"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.5/sprat-0.4.5-macos-arm64.tar.gz"
      sha256 "26d5990fedc9d9c54ca07719f24626230fbdb101d0920fde5338242950dff499"
    end
    on_intel do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.5/sprat-0.4.5-macos-x86_64.tar.gz"
      sha256 "1cc86200621af69a64d3bcc1a07f6eb4c7e559e9eea9cdf90d6d4b402fb76473"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.5/sprat-0.4.5-linux-arm64.tar.gz"
      sha256 "0e34c7043107b5aec6e69f1d58e0c18bf338affa6677301a531e4dd0d5390317"
    end
    on_intel do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.5/sprat-0.4.5-linux-x86_64.tar.gz"
      sha256 "052c19ea542a10755626cce16a067f4723674fbab2a4f3b41a24da40c0e9e9d8"
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
