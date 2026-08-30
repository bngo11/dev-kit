# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/0b0069d6c29c605dd2bc8d10d55e49a0c6cb76d8 -> wit-bindgen-0.61.1-0b0069d.tar.gz
https://direct.funtoo.org/2a/7c/a4/2a7ca491663a18e3b3205c270f5b079d6f48d680355500bc316cada370e5210c14d911fcf25fa9e0406b8902b9271b90a9f1d06d7d2dda2a3f454386bf863a7f -> wit-bindgen-0.61.1-funtoo-crates-bundle-3a934972ff3448091cbaf0385eca5d40a632e553268e66e6946ce53d2aeec283833ef59c773ebf97495b0fdd7581f245bcf630cb8e5b45da9f3b444c8b1d378e.tar.gz"

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