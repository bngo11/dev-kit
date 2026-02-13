# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/51080a08cafd3e056abf17f75bf9b7a01a98a8a7 -> wit-bindgen-0.53.0-51080a0.tar.gz
https://direct.funtoo.org/ba/44/a2/ba44a23354cda58b328766454a1bd156724d39fe84e62fb9f65bc6afde02a29f4d20e7b299d75b954cff0b4e416d1c96926c0d38f60c4fc12ff6a07237afaf9d -> wit-bindgen-0.53.0-funtoo-crates-bundle-2bd65ce25f1e0469f30c965a45baa39eb882e77c6a450a55e31dc94a5f40e2cfc9b980375c909e129f0c75307053a6587d27b8ff14bd13bc571c52cf2d4c061c.tar.gz"

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