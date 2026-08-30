# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/e22236a928eeb876b2ccaad2f3d1ce5f6450281a -> bottom-0.14.9-e22236a.tar.gz
https://direct.funtoo.org/5c/d5/51/5cd551b2d333579eaad7eea95131ab0915e18ed26e7b9e3f654a7414d50b0d75e9a177459c124b753573ab1b01b2ca2a70c08b584a6eb58594053d52c0ccda3b -> bottom-0.14.9-funtoo-crates-bundle-6b4a91c06412f753f6b3a34c2785fbff693fdf4a2981b3332ce4c92ca4828fb9b16e4ad2d51e4740fbc1f6948d6ffcd6b63a1b253593f603460d9250fe81e882.tar.gz"

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