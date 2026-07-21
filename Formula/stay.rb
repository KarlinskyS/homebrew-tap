class Stay < Formula
  desc "macOS CLI that prevents idle by posting real mouse movement events"
  homepage "https://github.com/KarlinskyS/stay-awake-cli"
  url "https://github.com/KarlinskyS/stay-awake-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "751c36c981d35cfd8b3380fae761abb7f179b0dfdbcbc7aeed64ad26bd1daa2c"
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
  end
end
