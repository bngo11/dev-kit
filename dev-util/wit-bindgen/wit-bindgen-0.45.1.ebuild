# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/5d37dfb192cc2683c414a267e6f2856d7785fa2f -> wit-bindgen-0.45.1-5d37dfb.tar.gz
https://direct.funtoo.org/d8/36/43/d8364371907e0106fc3acaa3d484134ea0523be06a32581e7bcdf96ca9207f3ffe18197679e964825113c764fc273573a8b008686f27395b790add51f452e975 -> wit-bindgen-0.45.1-funtoo-crates-bundle-db5cdaa82db7c65e99fd197fe1d022d0b59654b326ddb22d19432e643278218324ffba7a35ead05a2370809797093f5fec267173db4394d1d0b1300846af9eed.tar.gz"

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