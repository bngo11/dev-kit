# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/0285a4680738439cb884d2674bec8be1e8beac5c -> wasm-tools-1.247.0-0285a46.tar.gz
https://direct.funtoo.org/37/67/48/376748ecb1ccd54446913118df080137a8c50c32f510ca91d297b4393eea0de42f28de5a4943e6699629c2bbf6b250b68650ecc242fc70b1cab597ccb93e9157 -> wasm-tools-1.247.0-funtoo-crates-bundle-0c3f5bf47ee7f7fddb2b1b8b4b6d872916721bc6d96c8b2bfe5d23ac0607cafd882db05814dc24085f4d1acc34c422489e52c57ea0e11ffc41e8a33f469ae133.tar.gz"

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