# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/7a2fa422cdf9aeeaf488a2acac8bc94a078bfa32 -> wasm-tools-1.263.0-7a2fa42.tar.gz
https://direct.funtoo.org/55/0d/39/550d39376c72412abdb8cd9d3c3bf4e5f3aec889d6666904e5823c58df0737169f8180361ae9941fb14506aaea29de1ff19336bd4b0d18b89d219e28439d96d1 -> wasm-tools-1.263.0-funtoo-crates-bundle-5bc3b66440efb086e3cf240718a79632b521e975dc1a3d50d5922d2a40d3b45760db1be824c386641ad344eb72184feaafb73d327a50a5ed943ff14f30ae9215.tar.gz"

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