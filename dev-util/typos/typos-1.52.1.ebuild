# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/2611abd15acb0c2e317fb9e45855aabb8b35a414 -> typos-1.52.1-2611abd.tar.gz
https://direct.funtoo.org/98/14/64/981464829ac326f912e7982a017f2fca04526e1af3056ad53019248b88a13597b0fe34cdd612e3cdf98bd9b0a1a0ffef3facfc27aef50d68d07d67401d7050da -> typos-1.52.1-funtoo-crates-bundle-cfcc80144169164541c0a8367b09fe4a77e7f4c643e57f51cfdfffa4e91777d6b17cdd2136ad43c71352a290e2ea0df06850260b8eedfa0a0d8bdaf8141f8ce4.tar.gz"

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