# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/dafe42f8f543ca76429d5ef7b5e84f41ae8e73fe -> wasm-tools-1.240.0-dafe42f.tar.gz
https://direct.funtoo.org/f5/7e/0e/f57e0e13e20fdd4dc04cca0806fdaf6c4f357b41c351d1cbb6d8a479209b1a25d9a9f406938f04fbbf0c7008c423a15fdc364d175f2f8b67d087cb4ab130f0a0 -> wasm-tools-1.240.0-funtoo-crates-bundle-8299a7cff1de5dbb8aa54e3fa8d4f8ef5b3ce6b9ed8d8ab7f4ea63d87bf88fbe8dbd472a77a8837a4b193c9bbf0b2a204c94d4986d713250fa4e0d1780790bc8.tar.gz"

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