class Onvif < Formula
  desc "A pure Dart library designed primarily for command line automation of Onvif compatible devices, but can be used anywhere Dart is used."
  homepage "https://github.com/faithoflifedev/easy_onvif"
  url "https://api.github.com/repos/faithoflifedev/easy_onvif/tarball/v2.1.0-dev.10"
  sha256 "745c33edbe03424046115ba423cf1e8b3331a376b7b864d66360e82e8c907f98"
  license "MIT"
  
  depends_on "dart-lang/dart/dart" => :build
  
  def install
    system "dart", "pub", "get"
    system "dart", "compile", "exe", "bin/onvif.dart", "-o", "onvif"
    bin.install "onvif"
  end
  
  test do
    assert_match "obs_websocket v2.1.0-dev.10", shell_output("bin/onvif version")
  end
end