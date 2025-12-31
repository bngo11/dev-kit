# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/6f8b8e75254174353fc27c269827c4c239d51eff -> wit-bindgen-0.50.0-6f8b8e7.tar.gz
https://direct.funtoo.org/f3/ac/7c/f3ac7c96575244090c7ca2b2a09ac2f2bc49b5a4c2bbb841a7ea229bb8308c5f6633b408e447a41df1790ae83858da0f0038c22927f86c4284c72847b241a94f -> wit-bindgen-0.50.0-funtoo-crates-bundle-61c8bf773707759148b22b7e791433deab8d8f70d0b54c1051fef0cdef0045630e30085fb8679e02b9e17aaeb1a808ece0b29f591117b5baff8a41537b0dc512.tar.gz"

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