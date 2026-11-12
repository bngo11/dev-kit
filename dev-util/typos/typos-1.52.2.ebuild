# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/276087d9a4f06398b3e04825487805e2d7375888 -> typos-1.52.2-276087d.tar.gz
https://direct.funtoo.org/39/45/68/394568ed55487920c8f4a3562104243c39a54f36e173ceac1174e117a62065a5eea913036576e4475d765e124557994240ab685afdc5db052c96f2c51377b0fb -> typos-1.52.2-funtoo-crates-bundle-cfcc80144169164541c0a8367b09fe4a77e7f4c643e57f51cfdfffa4e91777d6b17cdd2136ad43c71352a290e2ea0df06850260b8eedfa0a0d8bdaf8141f8ce4.tar.gz"

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