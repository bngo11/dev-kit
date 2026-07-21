# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/75f19806f94769f0c48041394bb8cab2e1d5fac1 -> bottom-0.14.6-75f1980.tar.gz
https://direct.funtoo.org/df/ae/09/dfae0910e86e3fb3bd6cbb6c876ec8455483cddfc90a5e93cc1779f2800723b72f97e886a565b0fa43ae68ccb483a35d894faeb1d3d72addacfa350a51b6a0e2 -> bottom-0.14.6-funtoo-crates-bundle-29458b1f17dd7ee1b2c59ba50e1541abfc4c67d36486f7a6b21dbcdc3e4025eceaf6a74a729047c34116e51c9b2327400ab7d8e285f16e76d571a8f79b35600b.tar.gz"

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