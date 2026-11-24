class Sprat < Formula
  desc "Product manager for every Claude Code agent on your machine"
  homepage "https://sprat.dev"
  version "0.4.3"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.3/sprat-0.4.3-macos-arm64.tar.gz"
      sha256 "4062e18a6bcd6c65c6afeafe788000b167ed5a07686afcada85366dffb835282"
    end
    on_intel do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.3/sprat-0.4.3-macos-x86_64.tar.gz"
      sha256 "5057fa2c57987b6695b4b543ca50441479a6755a84d063643211f7c1c5c2c470"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.3/sprat-0.4.3-linux-arm64.tar.gz"
      sha256 "4c00f23c36327f736722a5d0a469fca3d58dbb39f4e78efb2b9a5af12c137dd5"
    end
    on_intel do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.3/sprat-0.4.3-linux-x86_64.tar.gz"
      sha256 "de8a26fd51fc6bd65b1c38ac7b0b2bf30f1d2055fd234f0f7910fbb76aceef11"
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
