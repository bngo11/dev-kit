# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/d66d4364c441d8b0122628509be52bd53c352a6e -> wasm-tools-1.252.0-d66d436.tar.gz
https://direct.funtoo.org/bc/c0/01/bcc001fd975b2045e2b381b76974894383eb605b00edb174079e3f7f6a07bbbfc0094b52d033eda67a0e96ca0693ff7990eb1ef1724c784a9f49bd49001ec297 -> wasm-tools-1.252.0-funtoo-crates-bundle-ef059ea7708868bed04615193027835ca5330173fdd208e541800646c7afddeca1e6e01dbd00f7363bd54507f1b2bdee37b3bb74a7890f5d0090d00a112ca1ef.tar.gz"

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