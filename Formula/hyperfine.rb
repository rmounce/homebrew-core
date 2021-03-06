class Hyperfine < Formula
  desc "Command-line benchmarking tool"
  homepage "https://github.com/sharkdp/hyperfine"
  url "https://github.com/sharkdp/hyperfine/archive/v1.0.0.tar.gz"
  sha256 "24f7802b7ab22ef7722c7920406a50a598f4adfffd37fd54eece0c352d8978a1"

  bottle do
    sha256 "4cfa7b2d80b087f758f8047a7941ed39869116d4da4073a862f4d3321f1d903e" => :high_sierra
    sha256 "e9106204563f10604136e80dcea0b69d89edab68e9a84a2e2c4edc0ef8fafe26" => :sierra
    sha256 "8644eda98bc9bb1c7c1c768ee837116917231aa4dcee8d8a8d959ab16dbd6e86" => :el_capitan
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix
  end

  test do
    output = shell_output("#{bin}/hyperfine 'sleep 0.3'")
    assert_match "Benchmark #1: sleep", output
  end
end
