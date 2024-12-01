# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/d1387cc70f67c53e31e2668a30a1e4fc8bdcb95a -> wit-bindgen-0.36.0-d1387cc.tar.gz
https://direct.funtoo.org/a6/04/b8/a604b8002fdb7ef8f66a3ec474e870ca9dbebdb50ff3fd721db48c88e7955d78281938aa1624ae7dcc14256acc303efc1612e8558f130018181782834d4c9f85 -> wit-bindgen-0.36.0-funtoo-crates-bundle-46af651cca12656cfbbfbc020950a72928193ffb75e4d6b6303f47cee6d454f4f8bf15f296c475dabe98a468a02be3d6c2f20727078e352f2c048c8f8e9fdffe.tar.gz"

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