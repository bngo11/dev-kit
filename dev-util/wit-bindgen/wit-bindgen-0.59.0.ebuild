# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/93a5f4e3a91c3d4bf73b48e9f09ca090335194cc -> wit-bindgen-0.59.0-93a5f4e.tar.gz
https://direct.funtoo.org/9b/e8/f5/9be8f5077ade569368e376b279fd5d4de1567e70cfb6cb44600e297faecd08d7ff567472f7961414c29edfbe1787a0b710a79989342972d36a0d0cee93a82e74 -> wit-bindgen-0.59.0-funtoo-crates-bundle-67f00d40c8aeafc81aee1a2399497025609de4b579f725e45753fd945a4c19fee33a8a3a0a9ea4cf774c4750801c46385e7f62f6b6e851b1cf4b1ff1f86e137a.tar.gz"

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