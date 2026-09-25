# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/00f422f3b19c57bc6338715ebfe3316d38768461 -> typos-1.50.3-00f422f.tar.gz
https://direct.funtoo.org/98/a2/c4/98a2c44e2a37292b39c07f1b4c713d563d51dedfaf0d73f082b0b755bdd8bbbebbb362e6f767e6fbaf05dddefcc43a04c14ec88adc463630a205bc5c537ee46d -> typos-1.50.3-funtoo-crates-bundle-aa49f8cc5cf9141e3d9da88f4fe5abef0f3bbb04b212f06a2d7c3a598213a824aae666438849afd1051d473429bea45a2b3f46604f383f1ad502956d49e5ee19.tar.gz"

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