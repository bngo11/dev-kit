# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/76927bf4bdbddf4b15f835c5eddfffbdfe3bdbd5 -> wasm-tools-1.245.1-76927bf.tar.gz
https://direct.funtoo.org/91/fd/11/91fd11fe60d7dc50c8aaf74a9bab6ef3ced461a91464876c33d699ed9691b5335ee0e1d551e0b24b2a6616784659b8f04aa82d74c93ae2900d031a98cf05cc91 -> wasm-tools-1.245.1-funtoo-crates-bundle-89108031e2ecec4f0a0a6a66a870745d1607f7807b037b1ac960aae5db5e1fce76dae983e7426bf2068d2721dd7530552e112531dd4c7ca5ad7700df03db602d.tar.gz"

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