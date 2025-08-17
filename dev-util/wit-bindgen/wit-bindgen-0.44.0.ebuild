# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/62a2af5db9b594cb9e3abd4bca507d900c9345ae -> wit-bindgen-0.44.0-62a2af5.tar.gz
https://direct.funtoo.org/f4/c3/a7/f4c3a740c2195b8cdb44123d407c865def3167d4af3625df11b7122439209278d6fe2e8609f8491bf5aaebe200c80a4e8fe93f1b691aa889c964e227a9adc5de -> wit-bindgen-0.44.0-funtoo-crates-bundle-8d56dc329dfe0e4b7749a3e2d2bf8e6aa2042a9e115ec6de3ad35313771803a368210548490db4ecd60ad43746b99394accc0b62dbe78474c38264ff92eb3fa1.tar.gz"

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