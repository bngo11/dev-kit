# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/80c8a4945eec0f6d464eaf9e65ed98ef085283d1 -> typos-1.38.1-80c8a49.tar.gz
https://direct.funtoo.org/c6/59/71/c659713a6649929d2fd902cd93d48d4e5b5a7cf8871619bd7c6c6e023d7ba0e9e37ae9f162048f40e41d703382974453ecbe2f8f94addf256e89b71f9c1ee3a1 -> typos-1.38.1-funtoo-crates-bundle-4d9f339a14a56700ef1801e741816853c8992f3b4120740954af1438e676c75cbb5f8a19f6535c694985fd893166d5a892f08002d6bd75dd0d4e38eb9b5394f3.tar.gz"

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