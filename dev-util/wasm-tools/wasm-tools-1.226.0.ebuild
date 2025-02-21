# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/41f183bb0e391d8c1ff2f243083f6e5898bfb33a -> wasm-tools-1.226.0-41f183b.tar.gz
https://direct.funtoo.org/6a/fb/31/6afb313892dd2bbbe7f228b5cd7439b6aef263a0bb53233ec6751bf90a1dadd5a3ab90b3d59d39198a70d409dc6acd994c1766a65e42263b19302d00e6d74a85 -> wasm-tools-1.226.0-funtoo-crates-bundle-c322aafba6f7c01a01da642de87ef8cdaf4fac1fec0d3e8a5694255e7228999778e5eb2e248f936c7430674393f7e60b88d9959fcd6ceddfd00a7bf58a5a0f29.tar.gz"

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