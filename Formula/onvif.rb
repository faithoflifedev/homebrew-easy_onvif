# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

$onvif_version = "2.0.10"

class Onvif < Formula
	desc "Command line ONVIF Client protocol Profile S (Live Streaming)."
	homepage "https://github.com/faithoflifedev/easy_onvif"
	url "https://github.com/faithoflifedev/easy_onvif/archive/refs/tags/v#$onvif_version.tar.gz"
	sha256 "59fce2f48604adfdc19a70124f3fcf54a574aa89957358c3ef9819334ae76a8a"
	license "MIT"
  
#   bottle :unneeded
  
	depends_on "dart-lang/dart/dart" => :build
  
	def install
		system "dart", "pub", "get"
		system "dart", "compile", "exe", "bin/onvif.dart", "-o", "onvif"
		bin.install "onvif"
	  end
  
	  test do
		assert_match "easy_onvif v#$onvif_version", shell_output("#{bin}/onvif version")
	  end
  end
  