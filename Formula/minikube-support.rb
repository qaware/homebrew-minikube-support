# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class MinikubeSupport < Formula
  desc "The minikube support tools provides a better integration into your local operating system. "
  homepage "https://github.com/qaware/minikube-support"
  version "0.1.1"
  license "MIT"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/qaware/minikube-support/releases/download/v0.1.1/minikube-support_0.1.1_darwin_amd64.tar.gz"
      sha256 "2c5ddace2ee78985aa7eed597f625f70e1565d0a563432cc75b819e712e48d23"
    end
    if Hardware::CPU.arm?
      url "https://github.com/qaware/minikube-support/releases/download/v0.1.1/minikube-support_0.1.1_darwin_arm64.tar.gz"
      sha256 "a14ca04aa9fea4053b06374c15f7fd53e5a97c29b0e1b75485b78c02ff25143e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/qaware/minikube-support/releases/download/v0.1.1/minikube-support_0.1.1_linux_amd64.tar.gz"
      sha256 "f27cba3d321fbf54c775cbbe925db621a9fb8ba80deb9fd6f41cfc05a51258b5"
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/qaware/minikube-support/releases/download/v0.1.1/minikube-support_0.1.1_linux_armv6.tar.gz"
      sha256 "f37bdde0337ac7a6490c562f391124ad58cb3eecd318083241c230597a4505dc"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/qaware/minikube-support/releases/download/v0.1.1/minikube-support_0.1.1_linux_arm64.tar.gz"
      sha256 "cb938235d161632d738f534851eae7f70ef31419209c690c2937124096510fe1"
    end
  end

  depends_on "mkcert"
  depends_on "minikube"
  depends_on "helm"

  def install
    bin.install "minikube-support"
    bash_completion.install "completions/minikube-support.bash" => "minikube-support"
    zsh_completion.install "completions/minikube-support.zsh" => "_minikube-support"
  end

  test do
    system "#{bin}/minikube-support --version"
  end
end
