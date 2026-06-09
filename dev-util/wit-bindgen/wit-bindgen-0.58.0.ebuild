# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/a2a1e02415442aa78bfca550eea020eae4191027 -> wit-bindgen-0.58.0-a2a1e02.tar.gz
https://direct.funtoo.org/1e/81/f5/1e81f529ae40fb4e6843282194ea3d5b4eb44046a3f8ad145a5202c3882b5f6d45fabc2ae8368916784a5f8dff8ad560202231d0e0a2154b8dc0cff18d5c616c -> wit-bindgen-0.58.0-funtoo-crates-bundle-e291ff8d7f2672a7d92c2241f39cc9e574b72af4ba75adde8772a2498c57513ed932be189556ada28ec358b98b8f37dd243174c1a5a306a4154e4972b2bbab3d.tar.gz"

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