# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/7b04f660f4ee4f048d18fd341887cf28dfbedfe2 -> typos-1.46.3-7b04f66.tar.gz
https://direct.funtoo.org/9f/d6/ad/9fd6add5c8bcfc0bd22cc87e25ab4a761e97c8bdff0c6415af921810c336699c5b6a8b36a804529ccf85e91b8549cd58ecd0645a34797fd933bca269c862e5c1 -> typos-1.46.3-funtoo-crates-bundle-1a814fc5c06fac19e903102ade83a31a70338a1d23192a5c18bc0b4defeb38c5b4dc82a1de27fd9381ce4fbe978b213cda2080df61bee0a35e10d3fcfb3d8929.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/typos"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/crate-ci-typos-* ${S} || die
}

src_install() {
	exeinto /usr/bin
	doexe target/release/typos

	local DOCS=(
	docs/design.md
	docs/reference.md
	CHANGELOG.md README.md
	)
	einstalldocs
}