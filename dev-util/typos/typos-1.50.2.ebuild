# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/512fc24f32f44ab01972217aaaf3dc86ec234d53 -> typos-1.50.2-512fc24.tar.gz
https://direct.funtoo.org/ed/3f/a8/ed3fa86dfc593679dcb8cbe4f320425f342994c91bad3e5d5b613b4f3867e6f6c7b2d1003441a19b770cc4d006177808db106cb3c49456f45ab816b92bd9e2b8 -> typos-1.50.2-funtoo-crates-bundle-aa49f8cc5cf9141e3d9da88f4fe5abef0f3bbb04b212f06a2d7c3a598213a824aae666438849afd1051d473429bea45a2b3f46604f383f1ad502956d49e5ee19.tar.gz"

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