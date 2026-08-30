# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/5c6d31c78f8bd503f558441ef9c732950a141d1a -> wasm-tools-1.258.0-5c6d31c.tar.gz
https://direct.funtoo.org/b9/7d/e9/b97de961c1ed7a25154dfc0f6b5b56b9825f57b624c1bfead334f7ae4617b796a41f3ab7beabea76e4e111f741be6d36e41ad53726c4a734c6230725bca10bac -> wasm-tools-1.258.0-funtoo-crates-bundle-92e6e164a4d1d745c7f3c1b182d61216ac33a45976c86befd2d8abff447f034cf44b2d3561063bbd819bba1d9cec090d585c7cd8a15bc4f3501787df9a68a1ae.tar.gz"

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