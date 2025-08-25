# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/a4c3e43aea0a9e9b9e6578d2731ebd9a27e8f6cd -> typos-1.35.5-a4c3e43.tar.gz
https://direct.funtoo.org/dc/e5/de/dce5de7f80697db2ef8337f20a2d4cb8a50a9daa3c9fb33e39dd7bd426118ed5ea7c8c3191f491262b078ffbf2f76e95a871288bcd8e35c2d837e03820e677a7 -> typos-1.35.5-funtoo-crates-bundle-7525eca87bf0e1e937c167d327d1e804527192ad5288baa671265ac6dafdf1baabd95ca8e9d74015572f6f53dd7536cce38e11eb76bd81130226d8e60905e12b.tar.gz"

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