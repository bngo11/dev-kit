# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/c8fcb7075da08a8a2d8b3fb14b091b4fd340b3a9 -> wasm-tools-1.209.1-c8fcb70.tar.gz
https://direct.funtoo.org/95/9d/a8/959da87f8c8bda6d18b5c18a8a33f30db507212d1ed5592117ddb40e0cad92a9cb50023a08f5eae00f670f61a50de46575e362ed0135989074075d312dbad57d -> wasm-tools-1.209.1-funtoo-crates-bundle-5d197c840f450e6e94e4dd63138f0b99bd1ad6c2dffa92c1d09a75f7f350936d136c3ad142b0a349a01c22b81bfcfad0a58e4571d90c4d74f8c646f43fc5daa9.tar.gz"

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