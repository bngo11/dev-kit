# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/4c0e9a4edb73efb7b41758562eb0055c0e99cf92 -> wit-bindgen-0.46.0-4c0e9a4.tar.gz
https://direct.funtoo.org/95/19/0d/95190d97c3fc045ab073c37ae666057522fe982ab2d9de897fac2e4ba6a2003e973952e7cec64e7ec67983b4ed98f07864f9c7954a4394c482d8caa445003936 -> wit-bindgen-0.46.0-funtoo-crates-bundle-60c6267abb37366bda6deb868634a9f348b1e8b64a4a58f14fd5c50b312226b80f205df4cb71321986aedd322debed1300cd4cc18494b9dd55ab1956ec78a971.tar.gz"

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