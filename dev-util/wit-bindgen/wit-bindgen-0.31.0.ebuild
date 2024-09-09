# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/b09f234081f5e185b27067af07beda2f9f04e6c4 -> wit-bindgen-0.31.0-b09f234.tar.gz
https://direct.funtoo.org/dc/9b/e5/dc9be5e8a0c450ec1e30bb5fc9424ecb4468b5e43e394a23ff6570f227c942eaba792ec009c2167281387ae096518234f664e46e4c10369f8ad4fa4d2f6b2576 -> wit-bindgen-0.31.0-funtoo-crates-bundle-d3dc0bcb0199936ee83a355c2afdc7a9a23ede82f0caf15d89ed01e9dd62440a20d84534a8619484ef3e664cf8616a3f800ed25223e9a468bcc514b9627ec40a.tar.gz"

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