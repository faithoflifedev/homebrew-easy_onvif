# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Onvif < Formula
	desc "Command line ONVIF Client protocol Profile S (Live Streaming)."
	homepage "https://github.com/faithoflifedev/easy_onvif"
	url "https://github.com/faithoflifedev/easy_onvif/archive/refs/tags/v2.0.9.tar.gz"
	sha256 "7221a9707232c9a58dada9c278ac0b5217df894c14845238c76ce7b0e3b2b38b"
	license "MIT"
  
#   bottle :unneeded
  
	depends_on "dart-lang/dart/dart" => :build
  
	def install
		system "dart", "pub", "get"
		system "dart", "compile", "exe", "bin/onvif.dart", "-o", "onvif"
		bin.install "onvif"
	  end
  
	  test do
		assert_match "easy_onvif v2.0.9", shell_output("#{bin}/onvif version")
	  end
  end
  