# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/efeee7cafa5a3dcdddb5aab27bc0c05f279929ed -> wasm-tools-1.249.0-efeee7c.tar.gz
https://direct.funtoo.org/fb/e2/a2/fbe2a2c9c62895d8b1e489442c5d0045fca9637e3b9e21aa27c098185821d1eb109b4fe5255fc82236dc3d9739d0e94910b7418c8cde0be234bcbe117697c68e -> wasm-tools-1.249.0-funtoo-crates-bundle-0ce2a3892b74f05bdc34c91ae5a4feb5d9ee49f3cce5399e0a3a83e313d381c5c7999c89a9ebcd0bf4735abf47ea73233c2e7298caeb536eb52b67585e2650e0.tar.gz"

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