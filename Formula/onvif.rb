$version = "2.0.11"

class Onvif < Formula
	desc "Command line ONVIF Client protocol Profile S (Live Streaming)."
	homepage "https://github.com/faithoflifedev/easy_onvif"
	url "https://github.com/faithoflifedev/easy_onvif/archive/refs/tags/v2.0.11.tar.gz"
	sha256 "de33cf8f29959162eb2af3cc7cbd3bbb93b61f8f4c22ac4b08d85679b898339f"
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
  
