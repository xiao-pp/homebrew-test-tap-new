class Gothanks < Formula
  desc "Automatically star your go.mod Github dependencies"
  homepage "https://github.com/psampaz/gothanks"
  url "https://github.com/psampaz/gothanks/archive/v0.3.0.tar.gz"
  sha256 "ce5440334b3eac2e058724faa4c6e4478ca1d81ea087e55ccca33f1996752aad"
  license "MIT"

  bottle do
    root_url "https://github.com/dawidd6/homebrew-test-tap-new/releases/download/gothanks-0.3.0"
    cellar :any_skip_relocation
    sha256 "7cb055a385c965cc2df6bf8ad04423c4d1477823f50f9840ae21058ca55f36f0" => :catalina
    sha256 "af13c4920dff0ed4be2bf80d4f4864a02da95e02e029408013efc139af107a5d" => :x86_64_linux
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    ENV.delete "GITHUB_TOKEN"
    assert_match "no Github token found", shell_output(bin/"gothanks", 255)
  end
end
