# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/e22db44da4eaf17a0e46ec55b911c7539589a3cc -> wasm-tools-1.262.0-e22db44.tar.gz
https://direct.funtoo.org/f9/19/d4/f919d4e606d5508d3fc61d3cb5a9595a09d63fa0a396545326b0b2bc09ce40bbcd6213cede57e549a0cf65cd454f29f4bec12951410884c17f685beb15c7e5ee -> wasm-tools-1.262.0-funtoo-crates-bundle-1cd24699c8918e6af8371d6f458d63656e38dc6d6a906c454b13f264a3aa51e33fd6306793e9a8ef7b084aac52862ee175454ee12632d01b2f20367e2f403d82.tar.gz"

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