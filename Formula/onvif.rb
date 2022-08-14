$version = "2.0.12"

class Onvif < Formula
	desc "Command line ONVIF Client protocol Profile S (Live Streaming)."
	homepage "https://github.com/faithoflifedev/easy_onvif"
	url "https://github.com/faithoflifedev/easy_onvif/archive/refs/tags/v2.0.12.tar.gz"
	sha256 "b7b09b35d33eea1b722c6ca93386defda4581e986fc43206b3f542a29387d52b"
	license "MIT"

	depends_on "dart-lang/dart/dart" => :build

	def install
		system "dart", "pub", "get"
		system "dart", "compile", "exe", "bin/onvif.dart", "-o", "onvif"
		bin.install "onvif"
	end

	test do
		assert_match "easy_onvif v#$version", shell_output("#{bin}/onvif version")
	end
end
  