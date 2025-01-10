# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/897ab1f691a9c9d5a8fc811a42fdd332d1ba5da9 -> wasm-tools-1.223.0-897ab1f.tar.gz
https://direct.funtoo.org/31/ed/07/31ed07d96e6c02c2e722567e28d4fe61d86ea09c984d73e42df1775c153d71f509ba34cf340f9558ce5bb9da2acd8a5364532ca9d63c22b0f210a2ea98efe0c4 -> wasm-tools-1.223.0-funtoo-crates-bundle-be24887da1839f4ad0aa335e70fa7c4876d344cb9dada6c430a9c25d4f7e0c703848b7b276d3b94f1d0a4543113a97b3a6e597f0b75cd043d50bac836866969f.tar.gz"

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