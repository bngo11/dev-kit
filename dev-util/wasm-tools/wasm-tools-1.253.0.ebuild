# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/c799bb87b9cf9dc4fa7d11d63c5d52cbb3c4eb38 -> wasm-tools-1.253.0-c799bb8.tar.gz
https://direct.funtoo.org/5d/c1/42/5dc142e8b881ed7d12dfd349899fd294a6175769896e11e160eb4d7bd4449d34035bc89f25559336da1f0f2b5e425d7ba1b0f2b6e17334762718b53b975848e0 -> wasm-tools-1.253.0-funtoo-crates-bundle-ef059ea7708868bed04615193027835ca5330173fdd208e541800646c7afddeca1e6e01dbd00f7363bd54507f1b2bdee37b3bb74a7890f5d0090d00a112ca1ef.tar.gz"

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