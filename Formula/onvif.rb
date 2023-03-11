class Onvif < Formula
  desc "A pure Dart library designed primarily for command line automation of Onvif compatible devices, but can be used anywhere Dart is used."
  homepage "https://github.com/faithoflifedev/easy_onvif"
  url "https://api.github.com/repos/faithoflifedev/easy_onvif/tarball/v2.1.0-dev.8"
  sha256 "2e829aef339e09f413e100ebefb650ee752f918386cb302e5fbaf69d9aeb4b16"
  license "MIT"
  
  depends_on "dart-lang/dart/dart" => :build
  
  def install
    system "dart", "pub", "get"
    system "dart", "compile", "exe", "bin/onvif.dart", "-o", "onvif"
    bin.install "onvif"
  end
  
  test do
    assert_match "obs_websocket v2.1.0-dev.8", shell_output("bin/onvif version")
  end
end