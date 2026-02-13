# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/d61d3708fe4a90ab811b94e1fd608f2f05fa2513 -> wit-bindgen-0.53.1-d61d370.tar.gz
https://direct.funtoo.org/bc/5c/cf/bc5ccf3f04797239bb8302e2b98303177249d610aa8a9fc1568bc6f4d30422f38fdec731b30f3efabf822280516fa9c2203613892cf9c6d0f71f2f402bab5e35 -> wit-bindgen-0.53.1-funtoo-crates-bundle-471eea5aa382238843e293f2ce8e7d1ba35338cdcac639dfc118e339a447b88512f9e220cb4105b4575a426b93b9c68b84fb887e4c65fd70e4a0035932e48bd7.tar.gz"

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