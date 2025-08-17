# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/9dd8df4fdc53597af7534b6a4d4c11d9065690d3 -> wasm-tools-1.236.1-9dd8df4.tar.gz
https://direct.funtoo.org/53/1d/a6/531da65bfd5c92d8538103d4a3fb756ad029e7265e61623bd5fb5bb3528506fca7f8bda976855f556c75d0b05928ed38fce2dc628eb63f07a6563c529dce2a8e -> wasm-tools-1.236.1-funtoo-crates-bundle-728e8f0ab030f85035aa82153eed0d5ef00abfdf46bac0df9b744b81ebdffb3f765fa4daded7fc61177c83c018693c4984dc39a98e0444761d50828e1a3005a5.tar.gz"

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