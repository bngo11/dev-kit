# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/91be0bbc8c5df685a74d87295e9cfff0be9c07c7 -> wasm-tools-1.219.1-91be0bb.tar.gz
https://direct.funtoo.org/1c/6d/80/1c6d8024d96c2a150676b0a15b31ea95b3f79baccefc6137569bcee3a833290975f9499839f0944d087fa0c7f48e27f821152a103a7749d8750622484813fe1e -> wasm-tools-1.219.1-funtoo-crates-bundle-3c4f547a8f6df7258724f633373008cad2794d8c068db67b80b1b9e59a57c84c3b21e5b1c9c6926e9de4ec74aa808e65d15b67a7a6d19d74ed040fc4cdfb39bf.tar.gz"

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