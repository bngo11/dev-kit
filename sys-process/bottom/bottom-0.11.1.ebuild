# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/2578f20ce542047e3906ef87334ce15fbb53c15a -> bottom-0.11.1-2578f20.tar.gz
https://direct.funtoo.org/68/6e/f2/686ef26d0ec7402fc25605c0d5db166a330375e68e49c72cac5c6432aebe4bd306eead5062d796353fb6cd14eee701c7a730552222f0505f2ee5f81232f2839f -> bottom-0.11.1-funtoo-crates-bundle-9b4b341a94707eef9c160af84167478b6d374e36e19580c1fd2b67986ed680ace9d6619f32f60e9d4c3dcd9f98fedd0533e3836def93a0e6be710cd1368db7f3.tar.gz"

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