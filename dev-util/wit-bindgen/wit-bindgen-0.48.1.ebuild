# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/d44d953b9bf9841d1bf5d1744fa7400cbecbefd7 -> wit-bindgen-0.48.1-d44d953.tar.gz
https://direct.funtoo.org/22/9e/58/229e5854a0faa3a826e48a9e9cae48e476fe2e84194acd6a7e1e94e135cb8fab18604c5cfe5483795dac19460b3b6c3ffa224f629c4c5d632d98d3be772cd1ba -> wit-bindgen-0.48.1-funtoo-crates-bundle-b3bd1ea688ede6252bffc4891de576c1885324b6cdbe2b675bba795f6c16e4e75f7a7a31260c6c0a7b81896b549d956c8bc105f28a050ae95221c32df291562e.tar.gz"

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