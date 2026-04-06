# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/ee323ec1dc7372be3cbd6cd35c6b2616a5009752 -> wasm-tools-1.246.2-ee323ec.tar.gz
https://direct.funtoo.org/c3/fc/46/c3fc461eabda0bafce1214b5b2d722a6fe8bd2b4a6f39287c108942a9ff283bea8b442d2aeafd0b9517f3428de38fc7ea060707332f31a58cb161cc7bf67ce9a -> wasm-tools-1.246.2-funtoo-crates-bundle-afe3add9a11b24716258fab32819b41ee27f302171742d19274bd4fb154435242944d8821da3293e615f9ffb9a5ee43e93b0403adf825b989196e805dc6b8d1c.tar.gz"

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