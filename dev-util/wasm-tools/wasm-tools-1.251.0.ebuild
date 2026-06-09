# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/a1a178a024c1204ac24ff957b9ba8cdca7f9c8ce -> wasm-tools-1.251.0-a1a178a.tar.gz
https://direct.funtoo.org/fe/d4/f8/fed4f8e3cc6de3e18004de42a6a4b5b84373d9d701e9ee6edf1c081e26071edcc2bce726d2f2879fcf6bfd62e9972ca6cce39b61f6ceff0a8285e402472987c9 -> wasm-tools-1.251.0-funtoo-crates-bundle-0ce2a3892b74f05bdc34c91ae5a4feb5d9ee49f3cce5399e0a3a83e313d381c5c7999c89a9ebcd0bf4735abf47ea73233c2e7298caeb536eb52b67585e2650e0.tar.gz"

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