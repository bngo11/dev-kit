# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/d05406062d031ae96146486f58a965d87eefea5e -> wasm-tools-1.243.0-d054060.tar.gz
https://direct.funtoo.org/c8/f2/15/c8f2159d9094858c7cf617d2b2fcefb8ab126b801f41bdca53031ace8c10d8536b8b6e33abc99554e3af0ebc7374715335e762efcdd7a07d8a58fc156d7fbeca -> wasm-tools-1.243.0-funtoo-crates-bundle-d47ba3e9beafeaee2fc4dc11f5b06bd47aace96de81523d2167e702f25b3846a5ac3cf2fd62dede625095a141517a6cfc77e6403c4379a99cd7402b4bfe5734a.tar.gz"

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