# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/320b5781474d4470a36b7f0626b131e99850e9d2 -> typos-1.23.2-320b578.tar.gz
https://direct.funtoo.org/5d/53/ae/5d53ae3a6b287f8c9e8398e18c31ee20201cb383b1054cef8e6b90b43f7b6fcf7a6bd3a5e4b232a774b4d58c05a4dd88ca8f7366a65bf45450e84737e71342fd -> typos-1.23.2-funtoo-crates-bundle-577631637e02f939e4530005aea1ad7985c75d5e30e3bf59c81b98a641880fab820c5caa8774f6c21a6895c4060a3eab578aa9aecd85114f36dfc8624c25b158.tar.gz"

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