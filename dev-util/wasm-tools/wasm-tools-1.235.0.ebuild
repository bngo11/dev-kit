# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/e26d5ebea0b8dbfdadaafc13bd4ee3814a7d01dd -> wasm-tools-1.235.0-e26d5eb.tar.gz
https://direct.funtoo.org/cb/a5/1a/cba51a8842342e267a46c079f32e72ba92a711c9ec4e70f5134062a8be37b64ff4411b01d569647239b2b00fbd0eb7723578c1e678ce1bae27fd15f862da1fe7 -> wasm-tools-1.235.0-funtoo-crates-bundle-72fcbaa4b77cad492e08c0a04c6a7112feff0e0ee8136159967badf7696b4c32f636203e546f4087a125cc18fd955133558bf9305bb3c81dad4da6f8ace7b818.tar.gz"

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