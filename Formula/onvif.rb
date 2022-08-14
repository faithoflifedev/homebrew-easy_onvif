$version = "2.0.13+1"

class Onvif < Formula
	desc "Command line ONVIF Client protocol Profile S (Live Streaming)."
	homepage "https://github.com/faithoflifedev/easy_onvif"
	url "https://github.com/faithoflifedev/easy_onvif/archive/refs/tags/v2.0.13+1.tar.gz"
	sha256 "ac9557850e31083135855cbcd4e4ad586e7beaaa3eab0ba8025a2f159d4ac338"
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
  