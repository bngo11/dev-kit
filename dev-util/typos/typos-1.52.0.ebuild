# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/4c8b7f51ca60df14e3c5ca82770dfbbe6c3dae85 -> typos-1.52.0-4c8b7f5.tar.gz
https://direct.funtoo.org/55/f5/78/55f57828dc2295252f40aae31b270be8429f94ed3cd1e9deb7d23a42bedd000b6c1abd2bbfe46d2fe33287f3f366af2ec95ff9eb1ca2c2d0a820ce0267dcc3ae -> typos-1.52.0-funtoo-crates-bundle-cfcc80144169164541c0a8367b09fe4a77e7f4c643e57f51cfdfffa4e91777d6b17cdd2136ad43c71352a290e2ea0df06850260b8eedfa0a0d8bdaf8141f8ce4.tar.gz"

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