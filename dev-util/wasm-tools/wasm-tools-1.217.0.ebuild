# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/46cb2e80abe9e57c422a3496032dd4c49bdefcd9 -> wasm-tools-1.217.0-46cb2e8.tar.gz
https://direct.funtoo.org/6b/9a/84/6b9a843f215d2de0d364a3144385a5bc87548f5a6d0855b48184be5730a687b9f0a065d9bc94d8a88878ca4449043e868302e4fb76a4d4e76a2053eaf1df9286 -> wasm-tools-1.217.0-funtoo-crates-bundle-8f2bdc606bbb26526d945242f9914a478566b3944df6201cfb13788e7e0524b5945ef4a8ad957516c20d647a074ddf889c3ab8615fde16bbc00d7be226a2ea36.tar.gz"

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