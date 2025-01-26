# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/953b183f67c6d556a22692b4514916aa3d0af393 -> wit-bindgen-0.38.0-953b183.tar.gz
https://direct.funtoo.org/6e/f3/d2/6ef3d2fed4adf1dec6e119f6b9ac403139ad2a7c65477e12aa17fdf18fdb580a03343248331fec688097994b194fec2913217254b2a9a17aba29e45d10c0a1d3 -> wit-bindgen-0.38.0-funtoo-crates-bundle-c2b7b2925e8d0905b2aa0005ca07ecb199825731b8c8416b509a8d33fe91797a7063ef229e15dca269bc3a22f39afe66754030253a5fc38000a9735b7e7e527a.tar.gz"

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