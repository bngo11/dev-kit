# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/0f7bc17806efcf324fe5b4d7fdb03629ec30ccff -> bottom-0.14.8-0f7bc17.tar.gz
https://direct.funtoo.org/98/4a/e6/984ae6335bdbdfc456e805cfde8473ae78e4f40705a490012921df3038e02ee01f82d0decd822fc3388fbafd1d66b60a3e4dc84e7b13eef4548e0fee72e2127a -> bottom-0.14.8-funtoo-crates-bundle-6b4a91c06412f753f6b3a34c2785fbff693fdf4a2981b3332ce4c92ca4828fb9b16e4ad2d51e4740fbc1f6948d6ffcd6b63a1b253593f603460d9250fe81e882.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

DOCS=( README.md CHANGELOG.md )

QA_FLAGS_IGNORED="/usr/bin/btm"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/ClementTsang-bottom-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}