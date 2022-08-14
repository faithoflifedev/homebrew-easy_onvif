$version = "__VERSION__"

class Onvif < Formula
	desc "Command line ONVIF Client protocol Profile S (Live Streaming)."
	homepage "https://github.com/faithoflifedev/easy_onvif"
	url "__ARCHIVE__"
	sha256 "__CHECKSUM__"
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
  