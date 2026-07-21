class Stay < Formula
  desc "macOS CLI that prevents idle by posting real mouse movement events"
  homepage "https://github.com/KarlinskyS/stay-awake-cli"
  url "https://github.com/KarlinskyS/stay-awake-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "95afb97c65e3a30b2447fd2a4118a688ec1e1d5a669e0b8a182134a6d9219aae"
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
    assert_match "Usage: stay", shell_output("#{bin}/stay --help")
  end
end
