# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/29e03934154913417189a9bfb8e2fa6682d1d795 -> wit-bindgen-0.63.0-29e0393.tar.gz
https://direct.funtoo.org/bf/9d/ab/bf9dab327d1f7f30fa601add7d623eaf01056035270930c2175c34be7841fece43f0feb06192a202786bb19c8879254a935ff93a112578488fae66d7366e6387 -> wit-bindgen-0.63.0-funtoo-crates-bundle-48efce24704a6b7e9b2c6f92a5cd1f343ac07ff54d5df708bd1c224062f2fac852181a18e0c0e11b06684ba2d906028850ef52b26e925551aaa2db21df38879f.tar.gz"

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