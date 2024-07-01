# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/1cf71f9a9bbb4706e1e5d21ad2a12586a3911199 -> wasm-tools-1.212.0-1cf71f9.tar.gz
https://direct.funtoo.org/2e/16/6b/2e166bb98a67d7367e7969a2937d08b79573f2eb65abc5afcfa4bd205c4a922893fadc75111c533982560a65c137c8cad75e4f7d7913969144d6befd3fb90d49 -> wasm-tools-1.212.0-funtoo-crates-bundle-9a67d037d29ecc16d39ab84349cc2cb46f5ebf939a442301291c3acebcd2f36fe5cd52244f57a908c12be6b6dc0d73ef966e9f7847a2cbb2cfddc7acfe01bbdd.tar.gz"

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