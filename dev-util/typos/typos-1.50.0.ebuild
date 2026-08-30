# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/4d9c206a77c041268485162b8e2579ad7a5cb9a3 -> typos-1.50.0-4d9c206.tar.gz
https://direct.funtoo.org/df/11/b6/df11b6122fe93c9e73081fe4576026df9175543f6dceb6a2390e1b12b0c89b88c25f9cf1321a3e35cbe1453a23e0a27ddee363a93090ab4e5c97787b79a4153a -> typos-1.50.0-funtoo-crates-bundle-31b443f1f0d98fb314a523563aa9935488bd75bbdd4454e94da107d51fb46ea3116252b6f3fb52d3b90dd57f3831e2bb4dd8ab31e25c6f870deadaa83b1d7eb9.tar.gz"

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