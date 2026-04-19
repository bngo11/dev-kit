# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/cf5f1c29a8ac336af8568821ec41919923b05a83 -> typos-1.45.1-cf5f1c2.tar.gz
https://direct.funtoo.org/82/71/69/82716976541be717289b86bc8604ea0cfce61f0676ee17e72c69feb879d7bf078a7b2bd7a191343b2d535cdac8e5b2b3717d5646f9ada1778034687e3660cd56 -> typos-1.45.1-funtoo-crates-bundle-f37a8761365bd869b346b85f2530440c81f5097d6595e0a9b4f177cc622a15f2ad7512de3c78c587b21318ba036f420b6718295ab6f462309d4173d09a73e9d7.tar.gz"

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