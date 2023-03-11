class Onvif < Formula
  desc "A pure Dart library designed primarily for command line automation of Onvif compatible devices, but can be used anywhere Dart is used."
  homepage "https://github.com/faithoflifedev/easy_onvif"
  url "https://api.github.com/repos/faithoflifedev/easy_onvif/tarball/v2.1.0-dev.7"
  sha256 "91c08823c72ae00fec529c743b42f29b6b31653ae0af3f03912492559ee984ac"
  license "MIT"
  
  depends_on "dart-lang/dart/dart" => :build
  
  def install
    system "dart", "pub", "get"
    system "dart", "compile", "exe", "bin/onvif.dart", "-o", "onvif"
    bin.install "onvif"
  end
  
  test do
    assert_match "obs_websocket v2.1.0-dev.7", shell_output("bin/onvif version")
  end
end