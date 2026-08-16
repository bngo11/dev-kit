# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/114be5245f143a8acf858aa236f6fd8ba7496dc2 -> wasm-tools-1.256.0-114be52.tar.gz
https://direct.funtoo.org/16/29/c3/1629c3a96ee1f3fa0b31da3f5872d0d4a1ba1388c00e63c10b4b263e9cfb037b809ee85a9188a7dbbc2006ef0297839e0275b0ec55a984ba18a5422cb414af5a -> wasm-tools-1.256.0-funtoo-crates-bundle-ef059ea7708868bed04615193027835ca5330173fdd208e541800646c7afddeca1e6e01dbd00f7363bd54507f1b2bdee37b3bb74a7890f5d0090d00a112ca1ef.tar.gz"

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