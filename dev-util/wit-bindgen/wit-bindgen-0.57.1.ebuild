# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/2e00369a643c0c8048b8636401e36b0cbf2dfb05 -> wit-bindgen-0.57.1-2e00369.tar.gz
https://direct.funtoo.org/53/d4/45/53d445f2ac671bb0c8f92a3ddd2dbeadcd194bbcfff829b9cc459d58d27e1c75dc0119adbcaaedcb2cfde42863306c99897c946fe1dc66f66b8460f6ddb0c67c -> wit-bindgen-0.57.1-funtoo-crates-bundle-2394be9ea9405a9390869cf9fbac28247c794886bb1fd0c5dd3458acd163cee64720f02dadeba5eb06b008a616c7d84241cffb83b427f61ae6aa192f4789ceb5.tar.gz"

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