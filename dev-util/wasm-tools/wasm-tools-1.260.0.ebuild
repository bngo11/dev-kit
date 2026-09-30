# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/3c92a0566d136333757e7c6da680178ae1d91dca -> wasm-tools-1.260.0-3c92a05.tar.gz
https://direct.funtoo.org/13/c6/6d/13c66d4bd314dd16b043b0b7ba63564effc02fdd814f0a888223c8d869d1c598bd41dd4336382cf8276bb9a57e3b9a7814e4441ceb5269cc63024e8ca9303e0d -> wasm-tools-1.260.0-funtoo-crates-bundle-41b58ac54a1d768a978c9a391057fa7e1889eb910d274a159664ac3aa4df3bbf20006003f5ca5b8d812e49ed7909ce2ac5df1e6b69e10ac550ba50da1e06bb98.tar.gz"

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