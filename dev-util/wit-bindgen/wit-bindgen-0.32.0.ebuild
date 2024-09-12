# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/dea39d07a6282da5cb7ff315802a5593d2962701 -> wit-bindgen-0.32.0-dea39d0.tar.gz
https://direct.funtoo.org/4b/2b/bd/4b2bbde1a6a1913716ae4904dd075b619d6d70f34c91c4f87c26ac274f6254948b0a287d4ac9068cb400e6849e217e6859b29312a396d1b558b17b243fc03341 -> wit-bindgen-0.32.0-funtoo-crates-bundle-668c048d47ebafc8b80b206572c5603078d9ce5628d32dcd674d12b666cb0e215e16ee54e621d2bfd373436a9461a98a7b298e2a90f623e6d76a5d30c6fdc440.tar.gz"

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