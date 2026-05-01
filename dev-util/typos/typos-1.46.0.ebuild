# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/bbaefadf97b0ec5fdc942684b647f1a6ab250274 -> typos-1.46.0-bbaefad.tar.gz
https://direct.funtoo.org/b4/e4/90/b4e490d91bec6b16fa5081065936fba522bf775db0a1081985e5f87d04fe7e0c6e7aa93bd847bfac4c81e349270f4db7eb253062e20bad37e010179c85264059 -> typos-1.46.0-funtoo-crates-bundle-f37a8761365bd869b346b85f2530440c81f5097d6595e0a9b4f177cc622a15f2ad7512de3c78c587b21318ba036f420b6718295ab6f462309d4173d09a73e9d7.tar.gz"

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