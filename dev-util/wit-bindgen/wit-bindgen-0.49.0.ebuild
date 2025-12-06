# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/ba933bda98214ffe2ae16c63b2b91d0932021bbc -> wit-bindgen-0.49.0-ba933bd.tar.gz
https://direct.funtoo.org/de/a3/17/dea3172feb8c4d6c10b855dfb2cabe767310b5f36e900be9088462d6e06dff2913b8dca636d5197845c89e1e5c929bf05b17b61187cc8fcba774b4728d118acc -> wit-bindgen-0.49.0-funtoo-crates-bundle-1fde5cd87817bba22462f03b3d23eb5a609697a0bd4eaa9a9aa0c10676df11ac1a0767fe4cfa45fabb1fa483c28a2726f375de107ddc1dc39ac304ee3b3d8543.tar.gz"

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