# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/9ad6f5c0549e0eb32bd70e26d5083421d639f278 -> typos-1.24.3-9ad6f5c.tar.gz
https://direct.funtoo.org/5b/45/c5/5b45c57c28890cde4ff126de73ae91e1ea79bb8cc40c2bef3b41739c7bc692e13b6e007f51529a45aab144eef873635f287e508c79ea3e5533b86e01b0f5e297 -> typos-1.24.3-funtoo-crates-bundle-a1204a3a4f6ba641954960e7092abc2cf51f13c3e1245e1697c95375a74a7ad87fab8bbc481bd5fbac5ba6681efd11662dbc647f0830edc864d469a8f2b8eb60.tar.gz"

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