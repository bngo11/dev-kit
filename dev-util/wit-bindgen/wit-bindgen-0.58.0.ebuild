# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/a2a1e02415442aa78bfca550eea020eae4191027 -> wit-bindgen-0.58.0-a2a1e02.tar.gz
https://direct.funtoo.org/16/c9/ab/16c9abdb89bcb885474c98f59bf4ef748a757b0fabd5be3b605fb3debe46cca1d15d6edc34ff1ef45559ee05f64c0a3bc208bc1efc35946baaaa97641cd7e3f9 -> wit-bindgen-0.58.0-funtoo-crates-bundle-e291ff8d7f2672a7d92c2241f39cc9e574b72af4ba75adde8772a2498c57513ed932be189556ada28ec358b98b8f37dd243174c1a5a306a4154e4972b2bbab3d.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DOCS=( README.md )

QA_FLAGS_IGNORED="/usr/bin/wit-bindgen"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/bytecodealliance-wit-bindgen-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}