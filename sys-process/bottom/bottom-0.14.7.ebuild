# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/6f3b62851eba9c27da4dcfc9f4edc8b9531f2d30 -> bottom-0.14.7-6f3b628.tar.gz
https://direct.funtoo.org/db/06/94/db0694d4a877ec04673156ebba17c920882eae8efb10191f4f3007d6473aec419d8bddf50c9e4ee74c1c2d4e0d25c786f23127ae039e15270d339cf6356de38b -> bottom-0.14.7-funtoo-crates-bundle-d87c49098b77634a008cff6c9bb00371e10af51f156efb42ca06b34cebb5fc8cb9417c4b4b3d4ca1990ab71cb803c8dfef5992904f55a45df68f4c758e263824.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

DOCS=( README.md CHANGELOG.md )

QA_FLAGS_IGNORED="/usr/bin/btm"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/ClementTsang-bottom-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}