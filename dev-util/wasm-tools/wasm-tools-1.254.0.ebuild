# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/bb58fdf919912e05c976a0b71aaa843f7d1938f9 -> wasm-tools-1.254.0-bb58fdf.tar.gz
https://direct.funtoo.org/f1/f4/ca/f1f4cada943e9e96b98c621b8355f71179982e4a90052a347d510a3fe3554035b87dac5f01dda394e3b0e75ab5661968d6b911f45d8e97a7c055e625f1c70ea7 -> wasm-tools-1.254.0-funtoo-crates-bundle-ef059ea7708868bed04615193027835ca5330173fdd208e541800646c7afddeca1e6e01dbd00f7363bd54507f1b2bdee37b3bb74a7890f5d0090d00a112ca1ef.tar.gz"

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