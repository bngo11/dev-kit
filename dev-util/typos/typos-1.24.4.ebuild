# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/853bbe8898c2e3ce040ba6fb0b2cbb3d0ababec5 -> typos-1.24.4-853bbe8.tar.gz
https://direct.funtoo.org/14/33/c0/1433c0b2ac6b5e60bdf934eca24fb1d9c3db3b360e56bae561306301c08d5b117aa5343b0044e6876a915ca2d72798106ec5d095e957f9d2afaef0661b9d14d0 -> typos-1.24.4-funtoo-crates-bundle-a1204a3a4f6ba641954960e7092abc2cf51f13c3e1245e1697c95375a74a7ad87fab8bbc481bd5fbac5ba6681efd11662dbc647f0830edc864d469a8f2b8eb60.tar.gz"

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