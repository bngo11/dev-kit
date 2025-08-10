# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/52bd719c2c91f9d676e2aa359fc8e0db8925e6d8 -> typos-1.35.3-52bd719.tar.gz
https://direct.funtoo.org/90/bd/93/90bd93645fa7d1ee2d1bc73b88951c1872fb88ef8fa2ba02e2435f90048467a792e39162bacf1a219471238e443caf381b524f1915cef947c47866140a95e2b5 -> typos-1.35.3-funtoo-crates-bundle-7525eca87bf0e1e937c167d327d1e804527192ad5288baa671265ac6dafdf1baabd95ca8e9d74015572f6f53dd7536cce38e11eb76bd81130226d8e60905e12b.tar.gz"

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