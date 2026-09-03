# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Cross-platform Rust rewrite of the GNU coreutils"
HOMEPAGE="https://github.com/uutils/coreutils https://uutils.github.io/coreutils/docs/"
SRC_URI="https://github.com/uutils/coreutils/tarball/05210358853b56b453829449218b2beabfacdace -> coreutils-0.11.0-0521035.tar.gz
https://direct.funtoo.org/7c/c5/52/7cc5525b7bd2d5e2d23213c83e7da5d267cf9927439847b544f37193aa01fc8af9c7f540c3388cc77d2882f839310c5175c346ee12619a675171cae5d8a760b3 -> uutils-coreutils-0.11.0-funtoo-crates-bundle-5102b5031ea515f8de18f9f454fbca3cfe8b447ee214274d87fa8ad675bef4e00f9ef02f3b8f5781a18f1ea9d01d757dd3214a4ed0fbfac467cb4d195f502037.tar.gz"

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