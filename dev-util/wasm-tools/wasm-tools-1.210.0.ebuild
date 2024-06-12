# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/976ce0a4a1cc127aacb733daf4658a933868e093 -> wasm-tools-1.210.0-976ce0a.tar.gz
https://direct.funtoo.org/e8/68/d2/e868d2d9f6da90afa90e6ec8d3b28bed571829533425730b09c75cbc74c03160257893c965180dfcab8a279530350fc1ec8561b75a614b980f4ab63687f5ec3e -> wasm-tools-1.210.0-funtoo-crates-bundle-20afd7bab846e71b81cd03b76b4494b2d0824d5fa59e92dcf5fba58c80502a417938a4eaa1bc46b7ec6fd8184de7355390cc795531241e257fa8c068ec8fa57d.tar.gz"

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