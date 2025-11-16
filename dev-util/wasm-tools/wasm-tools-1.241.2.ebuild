# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/a1712da0354bea5a38275d7ddf30f707b5757a68 -> wasm-tools-1.241.2-a1712da.tar.gz
https://direct.funtoo.org/8b/72/2d/8b722d145aa2afc9e033d3848a2e3817491e210ca592296626db9438243e04ef32a396e39742449f9ecfd2714ecc1b871137ef406bb2ca9f2c15522cc52c0c95 -> wasm-tools-1.241.2-funtoo-crates-bundle-d47ba3e9beafeaee2fc4dc11f5b06bd47aace96de81523d2167e702f25b3846a5ac3cf2fd62dede625095a141517a6cfc77e6403c4379a99cd7402b4bfe5734a.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DOCS=( README.md )

QA_FLAGS_IGNORED="/usr/bin/wasm-tools"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/bytecodealliance-wasm-tools-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}