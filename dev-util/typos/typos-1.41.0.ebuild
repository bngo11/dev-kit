# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/5c19779cb52ea50e151f5a10333ccd269227b5ae -> typos-1.41.0-5c19779.tar.gz
https://direct.funtoo.org/d1/48/4f/d1484fc01780df625902868dd2db2e486b632dbf760d856d5d49724a02f76d8708afd977a375c018dc4a687576a840e7a22e38d2bf5e465776534e846a165eac -> typos-1.41.0-funtoo-crates-bundle-d8ae51bf9a8944e90e1d8a80787b77f6f32cf8b4896fb42bf9bd63b192e20c581c3bb0adc3d76dbd946d35203994f5effdd80f7585801c222f0d48d6421e5603.tar.gz"

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