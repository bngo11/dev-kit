# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/8b4fa41ab7495f79dfa6857fdd52aa39c216c076 -> wit-bindgen-0.26.0-8b4fa41.tar.gz
https://direct.funtoo.org/6f/51/87/6f5187a49efd60077dca5916bb5210d5172d597182c5fb971e32c8cbd6375b9dffa27cc8ec5126e2a22072aa23eef7b567bbf5118972808b5d87b545481566bd -> wit-bindgen-0.26.0-funtoo-crates-bundle-f1c4a94320b94a34c364f334f15538b441efedebadd3c9375f9d01eeccd599227666897b5321f33d77571d6137ca698f615b5e2d70424c382c274408d5e91d15.tar.gz"

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