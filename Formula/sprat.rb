class Sprat < Formula
  desc "Product manager for every Claude Code agent on your machine"
  homepage "https://sprat.dev"
  version "0.4.6"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.6/sprat-0.4.6-macos-arm64.tar.gz"
      sha256 "622f26917479f8a12b4d5740e7df8b361074795513f36949675548977c786368"
    end
    on_intel do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.6/sprat-0.4.6-macos-x86_64.tar.gz"
      sha256 "46c96a6824f89d0edd66dc2c43857b1c67c830038fabf9dc0ab238aa128a8589"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.6/sprat-0.4.6-linux-arm64.tar.gz"
      sha256 "a7b71f33206086970d386545e35329b0a34fcc453f633f95f20c70f149d3170b"
    end
    on_intel do
      url "https://github.com/sprathq/sprat-releases/releases/download/v0.4.6/sprat-0.4.6-linux-x86_64.tar.gz"
      sha256 "0660ac24c94c0c124407f1065d1746b824960040ff08c21bc1fdd3a701ebadb4"
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
