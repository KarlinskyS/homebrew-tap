class Stay < Formula
  desc "macOS CLI that prevents idle by posting real mouse movement events"
  homepage "https://github.com/KarlinskyS/stay-awake-cli"
  url "https://github.com/KarlinskyS/stay-awake-cli/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "ed1f96edc47054688db3755026e88152abdb1db423492afbdad3f6b9b4007ac4"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build",
      "-ldflags", "-s -w -X main.version=#{version}",
      "-o", bin/"stay",
      "./cmd/stay"
  end

  test do
    assert_match "stay #{version}", shell_output("#{bin}/stay --version")
    assert_match "Usage: stay", shell_output("#{bin}/stay --help 2>&1")
  end
end
