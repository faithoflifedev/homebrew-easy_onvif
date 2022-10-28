class Onvif < Formula
  desc "A pure Dart library designed primarily for command line automation of Onvif compatible devices, but can be used anywhere Dart is used."
  homepage "https://github.com/faithoflifedev/easy_onvif"
  url "https://api.github.com/repos/faithoflifedev/easy_onvif/tarball/v2.0.13+10"
  sha256 "4ef1d6f27107b5a6267f589c6781ece9b770afe57d92aff0b7524cd0a0493c69"
  license "MIT"
  
  depends_on "dart-lang/dart/dart" => :build
  
  def install
    system "dart", "pub", "get"
    system "dart", "compile", "exe", "bin/onvif.dart", "-o", "onvif"
    bin.install "onvif"
  end
  
  test do
    assert_match "obs_websocket v2.0.13+10", shell_output("bin/onvif version")
  end
end