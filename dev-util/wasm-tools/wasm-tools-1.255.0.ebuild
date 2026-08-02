# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/76e20611d1920a7a39ca08983c6c77c3060de380 -> wasm-tools-1.255.0-76e2061.tar.gz
https://direct.funtoo.org/4d/7e/c5/4d7ec5dc1fdc77967654cfa0d27e66a79939102ef01c2140820b3089b72e6c0c46b69df89660baf3960ee73f923258bafa00df43627d70c00c0cdd52e3a697d8 -> wasm-tools-1.255.0-funtoo-crates-bundle-ef059ea7708868bed04615193027835ca5330173fdd208e541800646c7afddeca1e6e01dbd00f7363bd54507f1b2bdee37b3bb74a7890f5d0090d00a112ca1ef.tar.gz"

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