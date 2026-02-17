# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/57b11c6b7e54c402ccd9cda953f1072ec4f78e33 -> typos-1.43.5-57b11c6.tar.gz
https://direct.funtoo.org/4a/92/89/4a92890fc5d7227f5f11128ffe046f454892123170ef806b960805dd76c1f802e39e38044a4fceac837985111d8b268b5155f367a3cebc3f2c47b3cc443c90d0 -> typos-1.43.5-funtoo-crates-bundle-2c5b4617e41a25ac5446f3fc7b7832d244b50138041d738a31a729a7510ab96cc1e6716ad9cf8d19fb4edbef75a28c7eefe31795693ccb6d8aea67f7d52e47b7.tar.gz"

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