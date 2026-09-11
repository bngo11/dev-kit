# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/c604ee01c03f50d7301984a3c920a650752cd136 -> wit-bindgen-0.62.0-c604ee0.tar.gz
https://direct.funtoo.org/ee/47/e1/ee47e1ad50cd6edbc1ea704a026be0e1e29a4f1e7f630d0f2a7a86d59ac1da749b9891d8dc428b00972d0911b2eeb40e587b8beea77435561c2099d2bb1d0fb3 -> wit-bindgen-0.62.0-funtoo-crates-bundle-5e3cbd60361049f6797dc03fa9bbe7e87f2478fd7be9bdf5f8bdd63911f441b75e6ac80bf90fa8963936bea4842fed86524617334ba877f2658ff338bdb4d1d5.tar.gz"

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