# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/aca895bf05aec0cb7dffa6f94495e923224d9f17 -> typos-1.46.2-aca895b.tar.gz
https://direct.funtoo.org/7d/fc/c1/7dfcc10f76fc0f21e5a25ef5dac4f9ee9fa8bb77cc72c1eb64a3a56ebafe660a13343ebd43095cc8dd850bd11c4a0d1cfaccf6812df52e9e1307f549c96c2c9a -> typos-1.46.2-funtoo-crates-bundle-1a814fc5c06fac19e903102ade83a31a70338a1d23192a5c18bc0b4defeb38c5b4dc82a1de27fd9381ce4fbe978b213cda2080df61bee0a35e10d3fcfb3d8929.tar.gz"

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