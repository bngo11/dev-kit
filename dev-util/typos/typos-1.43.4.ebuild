# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/78bc6fb2c0d734235d57a2d6b9de923cc325ebdd -> typos-1.43.4-78bc6fb.tar.gz
https://direct.funtoo.org/46/39/66/4639664dde6359fff93e4be25efc67b54cdd0fd740d7323fd9e65f288d7f554bd441a8cf4dc2866e60fe77f78b8345b02b2c2e7c530d2e49b73c3d80d1dd8bcd -> typos-1.43.4-funtoo-crates-bundle-2c5b4617e41a25ac5446f3fc7b7832d244b50138041d738a31a729a7510ab96cc1e6716ad9cf8d19fb4edbef75a28c7eefe31795693ccb6d8aea67f7d52e47b7.tar.gz"

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