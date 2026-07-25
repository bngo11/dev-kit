# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/1ae00530221542369d0e47ee4a1f4232f09d978d -> wit-bindgen-0.60.0-1ae0053.tar.gz
https://direct.funtoo.org/04/38/b7/0438b7c6dbd9104fc6dfd6f1689eafc3e35d987ef8e259ad4e526ab9ba2724fe7fa62b61c7c5819116233e8e548289cb7aec7232ff4e3671509a6817bff1a5d0 -> wit-bindgen-0.60.0-funtoo-crates-bundle-e9750f9a7e547bec5f055bec7b77a34c47fc478a327ca78cdf9c6313662ffa419c15711a3bf828c8718e94e94ad821b0abf3e5736b8defcf456af0443869a7d5.tar.gz"

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