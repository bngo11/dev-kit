# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/2f0e9dea99232f0cb116dd1011d9ff1ba9495594 -> bottom-0.12.3-2f0e9de.tar.gz
https://direct.funtoo.org/5f/fb/a3/5ffba3fa88a298126142c7fb968e575627ccd197930eab20e16476ecec03e29628a5b01713a0a959d0ee781888a26fcb30b8e9c9060726b159af0a64bb56cfb3 -> bottom-0.12.3-funtoo-crates-bundle-9a0e52ad683407c74f9f777fa852748e097ffce59a7b884d6d187caa2eaa2a0be979f36ca0c81955d1c96be66baee0a4cccf125e3a69ba45dbfac660718b754b.tar.gz"

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