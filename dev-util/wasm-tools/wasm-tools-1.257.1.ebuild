# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/3ef3cefcdc958c859a1dca79d677327e9453859d -> wasm-tools-1.257.1-3ef3cef.tar.gz
https://direct.funtoo.org/4b/a8/41/4ba841a33d013d20cb134ee116d4c8dab0dc0e4161681c29d944a119695d9e21d1ec52ccf814b3c5af735edc53c7a9166ecfc19320d3045be7987d9c63a83b71 -> wasm-tools-1.257.1-funtoo-crates-bundle-92e6e164a4d1d745c7f3c1b182d61216ac33a45976c86befd2d8abff447f034cf44b2d3561063bbd819bba1d9cec090d585c7cd8a15bc4f3501787df9a68a1ae.tar.gz"

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