# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/b1ae8d918b6e85bd611117d3d9a3be4f903ee5e4 -> typos-1.33.1-b1ae8d9.tar.gz
https://direct.funtoo.org/e3/ec/c8/e3ecc84745af195315fbbf1b89922d2235e800a3d89a485de47aa3aefd11d84ddc28064a7da6ade44f05236e19958999a3d3c4a24da128cb99ff726f82fd6c07 -> typos-1.33.1-funtoo-crates-bundle-4cfe2937d97fcfa2ea94ce98a30ff5ed63cda911c672f5b582365a6dbb5255e06b711da67876f0d1353ed9b47d2de6aeba65c0cfba05217c6c1b4626ee85817c.tar.gz"

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