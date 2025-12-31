# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit cmake

DESCRIPTION="UTF-8 C++ library"
HOMEPAGE="https://github.com/nemtrif/utfcpp"
SRC_URI="https://github.com/nemtrif/utfcpp/tarball/63d64de49fd6b829f7c8694df5ab2ee625cb7134 -> utfcpp-4.0.9-63d64de.tar.gz"

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