class Onvif < Formula
  desc "A pure Dart library designed primarily for command line automation of Onvif compatible devices, but can be used anywhere Dart is used."
  homepage "https://github.com/faithoflifedev/easy_onvif"
  url "https://api.github.com/repos/faithoflifedev/easy_onvif/tarball/v2.1.2+9"
  sha256 "220cb0bc8c82cb5c24412d461d79038242b6b269afaf0dce9fd42579f17c34a3"
  license "MIT"
  
  depends_on "dart-lang/dart/dart" => :build
  
  def install
    system "dart", "pub", "get"
    system "dart", "compile", "exe", "bin/onvif.dart", "-o", "onvif"
    bin.install "onvif"
  end
  
  test do
    assert_match "obs_websocket v2.1.2+9", shell_output("bin/onvif version")
  end
end