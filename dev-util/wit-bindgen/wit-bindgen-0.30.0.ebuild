# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/7b4d9e5165ef49731d05d53210f2d8f8192ee78f -> wit-bindgen-0.30.0-7b4d9e5.tar.gz
https://direct.funtoo.org/cc/1c/5b/cc1c5b778cc5f8ba2c338e03fa8582aa08972ab8ec7c20d96499586e66113edd81454632c8115d61b638d651d3aff9f67510fdca3151847f8cb3c21da758c486 -> wit-bindgen-0.30.0-funtoo-crates-bundle-78e0747f7ade9cbaf97cd9358dcb31489b907b73a70df6c688a334700b649f32596c15b1ad4445f7529523ec6fe9376566603f66bc1d201a66a3f53a8ea27c0d.tar.gz"

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