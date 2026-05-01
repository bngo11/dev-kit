# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/c523ab6ca42dcd5d8da2976bf4ba8905007a0c2e -> wasm-tools-1.248.0-c523ab6.tar.gz
https://direct.funtoo.org/5e/d0/60/5ed060d04a3ed1217a17d3aba6598b7decf4ee4acea687c030b54aa0c5fe133b7f0b2efcaff34a52e56a6fa3b91db81b8c4ec8c5322c7d1cbcd0e924d9c40558 -> wasm-tools-1.248.0-funtoo-crates-bundle-0ce2a3892b74f05bdc34c91ae5a4feb5d9ee49f3cce5399e0a3a83e313d381c5c7999c89a9ebcd0bf4735abf47ea73233c2e7298caeb536eb52b67585e2650e0.tar.gz"

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