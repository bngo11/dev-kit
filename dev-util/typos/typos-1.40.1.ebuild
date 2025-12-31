# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/1a319b54cc9e3b333fed6a5c88ba1a90324da514 -> typos-1.40.1-1a319b5.tar.gz
https://direct.funtoo.org/38/18/1c/38181c1876db36075391f41bdc998beb951f7b3e4d47bc47320c5cd568df25898b4cc0a4a6f5ee30cce7f8ba1f3a7ac12b969995f1c0cd383c64c8356010bd41 -> typos-1.40.1-funtoo-crates-bundle-d8ae51bf9a8944e90e1d8a80787b77f6f32cf8b4896fb42bf9bd63b192e20c581c3bb0adc3d76dbd946d35203994f5effdd80f7585801c222f0d48d6421e5603.tar.gz"

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