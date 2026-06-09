# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/37bb98842b0d8c4ffebdb75301a13db0267cef89 -> typos-1.47.2-37bb988.tar.gz
https://direct.funtoo.org/8f/99/b6/8f99b63d53d27a4ebe2ec33280b9dc680bc08ad52bce2bd9e9ed6e8201964b24dec6282149ea0684a281b231c8ad58e1b0c8e5f15ca5a361662db8f671543d83 -> typos-1.47.2-funtoo-crates-bundle-f50d0f51874318493e1f793c6cc2c8f8c3e251a0a8262558aa00fb4fd91d9d2ed7e3cb5e24d508e2c101625b59ba16d6f4661ad8aff464e870a5213e86195928.tar.gz"

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