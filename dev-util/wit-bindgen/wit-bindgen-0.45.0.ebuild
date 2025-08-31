# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/1ee3108776c4ccd92446303632bd825f9c49e986 -> wit-bindgen-0.45.0-1ee3108.tar.gz
https://direct.funtoo.org/e8/1a/95/e81a9505e1121eac1a3e5859942cf0c0c9841158dd27713142f5842a521ac59de14ecfa8302a821108336f7c6fde6d75a96ad4dd51e57b8a8b037c052fbf8e37 -> wit-bindgen-0.45.0-funtoo-crates-bundle-db5cdaa82db7c65e99fd197fe1d022d0b59654b326ddb22d19432e643278218324ffba7a35ead05a2370809797093f5fec267173db4394d1d0b1300846af9eed.tar.gz"

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