# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/06d010dfe4c84fdab1a25ea02b57b3585018ba80 -> typos-1.42.3-06d010d.tar.gz
https://direct.funtoo.org/a6/b1/58/a6b15818ce0172324227f4f1a4df2c69084adfa70176eed5a636146ef0b38efca98923fee40b1d4aa859d6b2830d5331e1612a1af87f0451a8492d836b8e4083 -> typos-1.42.3-funtoo-crates-bundle-5cac3f75ed1dba4a5d06acaf2e1a9360a9459d94a34c981b459636ce60b2c25c742e23788bcb371f5306079904d56e11e087c20a548b09245390aaaec5c26348.tar.gz"

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