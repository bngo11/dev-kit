# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Cross-platform Rust rewrite of the GNU coreutils"
HOMEPAGE="https://github.com/uutils/coreutils https://uutils.github.io/coreutils/docs/"
SRC_URI="https://github.com/uutils/coreutils/tarball/53e6f64b1519ebd0b18dfaf07e7006f233bbcc46 -> coreutils-0.10.0-53e6f64.tar.gz
https://direct.funtoo.org/1b/48/e8/1b48e8606a722f7e33d5b2f550a59327179189b236dee05648fff8455d7310a9c29cc9238c066ab9738b54a915fe3bd6761c92a516823ea8a8b9067b3a3b33fa -> uutils-coreutils-0.10.0-funtoo-crates-bundle-e4650f409b7e541af73d896117fcfd61c603bbfd6cd6dd9b6d97db5fd4621f8e8100e0d2087d394d1a65c0ee508d2d937eb100a939abe609366d5ab2a4c32b06.tar.gz"

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