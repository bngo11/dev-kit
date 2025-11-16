# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/875e8632bb4b45d6b6ea1e3a72c66354c86d5d29 -> wit-bindgen-0.48.0-875e863.tar.gz
https://direct.funtoo.org/7c/50/d5/7c50d5379a09bd29b3211090bd32bc33899d400073eed884d8f21dc2fea9e930aa8f6255d4ff079d595ca42a4c428d8ed81f45526aad5d4f7ca388cc55325c40 -> wit-bindgen-0.48.0-funtoo-crates-bundle-b3bd1ea688ede6252bffc4891de576c1885324b6cdbe2b675bba795f6c16e4e75f7a7a31260c6c0a7b81896b549d956c8bc105f28a050ae95221c32df291562e.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DOCS=( README.md )

QA_FLAGS_IGNORED="/usr/bin/wit-bindgen"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/bytecodealliance-wit-bindgen-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}