# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/c8fd3764afbf5eaf6e53d2e6571c835db2c8fa5f -> typos-1.29.0-c8fd376.tar.gz
https://direct.funtoo.org/ee/da/d2/eedad2e21da6473f086e32575bcee4ad924d7c8f269b13f1e1527b4b0c753044300969954e263d6f0316bfcc134acbade69355647e2f6b7de52b85a30c6711a9 -> typos-1.29.0-funtoo-crates-bundle-6dad1b05925cac5d60b39987f4e04f6a39177eecee1284426b6b829936e7def7c021a8cd1f9d0818373947ec4de31ea7dae4ea26e5d0cb6dcb4fcf30e2a7296c.tar.gz"

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