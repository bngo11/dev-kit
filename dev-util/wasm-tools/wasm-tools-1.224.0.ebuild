# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/b237793139c81f8cf3b6bd4b7baf3f2c5c8f93f2 -> wasm-tools-1.224.0-b237793.tar.gz
https://direct.funtoo.org/6c/22/e0/6c22e0bb76d58a909a84684fb5470dac9689fbc881b73400cb2167f6fa85122378517aaaee1b2450636e48edcafddb809a889e8f61d0b65933871703dfcacb75 -> wasm-tools-1.224.0-funtoo-crates-bundle-be24887da1839f4ad0aa335e70fa7c4876d344cb9dada6c430a9c25d4f7e0c703848b7b276d3b94f1d0a4543113a97b3a6e597f0b75cd043d50bac836866969f.tar.gz"

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