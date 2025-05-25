# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Cross-platform Rust rewrite of the GNU coreutils"
HOMEPAGE="https://github.com/uutils/coreutils https://uutils.github.io/coreutils/docs/"
SRC_URI="https://github.com/uutils/coreutils/tarball/e4ec7fded977059e3184b9a41dec16783715adb7 -> coreutils-0.1.0-e4ec7fd.tar.gz
https://direct.funtoo.org/53/0e/00/530e00c876c8ee6901eedfcec47254cde22e602eaf462d5ce50c87e7ee6541770c6f4d82e18346b5956229b3d643e8373a3fe48232c81ad390e8ce4ca56e0243 -> uutils-coreutils-0.1.0-funtoo-crates-bundle-a9023e4c50b4b3f774e0c6f411e43cded396bdff40dbe2d3a7ea3c791fed3b1d745651037822626aa950185b525f1bfe9c571ed5ee7b65c3d7da390fb67ea6d0.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

DOCS=( README.md )

QA_FLAGS_IGNORED="/usr/bin/coreutils"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/uutils-coreutils-* ${S} || die
}

src_configure() {
	cargo_src_configure --features unix
}

src_install() {
	cargo_src_install
	einstalldocs
}