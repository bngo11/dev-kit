# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/083589ac255bb867e928b6564f5550b3770fb9e8 -> wasm-tools-1.234.0-083589a.tar.gz
https://direct.funtoo.org/6f/0c/ee/6f0cee9eaac12b3927521cef66f69ecb8237124ecf8680b59e310ae49f014feaf05a55da7609fe20c8c67c04092d8e51bc87ff60dd86c2b544e6ee832f4a44e4 -> wasm-tools-1.234.0-funtoo-crates-bundle-72fcbaa4b77cad492e08c0a04c6a7112feff0e0ee8136159967badf7696b4c32f636203e546f4087a125cc18fd955133558bf9305bb3c81dad4da6f8ace7b818.tar.gz"

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