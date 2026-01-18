# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/0c39eee9f23d0530ed81bdf68bdd91fcc09ae08f -> wit-bindgen-0.51.0-0c39eee.tar.gz
https://direct.funtoo.org/46/1d/3f/461d3f2822f9b06e4a7dad091708682aea72cb2b0b1697925f9ced9c3227894f8c8cf33a525a4df1e1722d384a53f0bd650a811284e0e8b396ccb1d96845a979 -> wit-bindgen-0.51.0-funtoo-crates-bundle-0e0a5e85e8b7dc210a1f9b4d7b6cb7ab8f55a6374afb802fced7eedd0063db1b326d1a9821f7256eb86d1c0713cd984fa3c60348fecef4e22b3d3e6a1792e193.tar.gz"

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