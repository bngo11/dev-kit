# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit cmake

DESCRIPTION="UTF-8 C++ library"
HOMEPAGE="https://github.com/nemtrif/utfcpp"
SRC_URI="https://github.com/nemtrif/utfcpp/tarball/2d8e20b22dcb3e9b3c4f52103182ebda949c6089 -> utfcpp-4.2.0-2d8e20b.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="*"
IUSE=""
RESTRICT=""

BDEPEND=""
DEPEND=""
RDEPEND=""

src_unpack() {
	unpack "${A}"
	mv *"${PN}"* ${S}
}

src_configure() {
	local mycmakeargs=(
		-DUTF8_SAMPLES=OFF
		-DUTF8_TESTS=OFF
	)

	cmake_src_configure
}