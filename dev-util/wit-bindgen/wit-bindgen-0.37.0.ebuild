# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/592805652c4759d30aa34f8d370527c1e79af0ec -> wit-bindgen-0.37.0-5928056.tar.gz
https://direct.funtoo.org/61/68/02/616802a5b60cd4ae197f2600f9089788d8ad3408cd4b95746ae664e5acc7410332ee0fc6f3cd97030505c7b505a3c58ff5b2ac3e842df00be22f330b1815876e -> wit-bindgen-0.37.0-funtoo-crates-bundle-8958429c82028c39dd62f57d3bfee2bb81f8cbfbfd47de6cb26f522a68845090792399e40c4c26f5142ed8a59ff6600047a455447d626c7638706db7ada4c98e.tar.gz"

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