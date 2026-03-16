# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/b858f8e0bfacf371dee1bbf7097b3022339feb93 -> wit-bindgen-0.54.0-b858f8e.tar.gz
https://direct.funtoo.org/1e/19/77/1e197742818078b4bb48febe6f5b249c715bec78db0d20227a5cf65d8fa74d95d6567dd603b4c827696781c4be65e517e14b3ac3e4dac6a7e61830cf3e4f82e5 -> wit-bindgen-0.54.0-funtoo-crates-bundle-471eea5aa382238843e293f2ce8e7d1ba35338cdcac639dfc118e339a447b88512f9e220cb4105b4575a426b93b9c68b84fb887e4c65fd70e4a0035932e48bd7.tar.gz"

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