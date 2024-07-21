# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/a4c4021dc9700297ac24fcb317a10a9dd4cfb672 -> wasm-tools-1.214.0-a4c4021.tar.gz
https://direct.funtoo.org/c3/54/d3/c354d3d07866927011ece398ee6f38c04631736faa3557372f798b4ef8baa8fccf22de4e188a5284d6e5c4367d75654bd69efe131163d83c8c86547d8952030a -> wasm-tools-1.214.0-funtoo-crates-bundle-4bac7d4e9ab51b0fb0e2bd8f7f1bda7038afd15f45d2db567fea9485bfc837c6ef11ab230a1ae1971291ecb938ef47f0268b48dd504c0098e0c5eb046e17ee72.tar.gz"

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