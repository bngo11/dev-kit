# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/4a72fcd2edb281073b466798bc4e111be2823c82 -> wasm-tools-1.250.0-4a72fcd.tar.gz
https://direct.funtoo.org/7e/7c/de/7e7cdea50778fa32a7d9016c9d6212f5ace30f0ad7477c5c3ce301dffd83731fd25803f7a7e16f5ae4a90957bfffb7817218060cda5718b3f5b27a4b01eef68d -> wasm-tools-1.250.0-funtoo-crates-bundle-0ce2a3892b74f05bdc34c91ae5a4feb5d9ee49f3cce5399e0a3a83e313d381c5c7999c89a9ebcd0bf4735abf47ea73233c2e7298caeb536eb52b67585e2650e0.tar.gz"

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