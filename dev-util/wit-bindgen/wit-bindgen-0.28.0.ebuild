# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/e103334cd1eef38b4ae9800dd6f09b4a8aec6e9d -> wit-bindgen-0.28.0-e103334.tar.gz
https://direct.funtoo.org/da/ae/04/daae04af5d4663247659dfb0dcce1e97ab52a33e5b2903395584a02617c046e6702ef5a8508a12ce68180ca28bbfd2a3205ec5e39abfe1845a581fdad013722c -> wit-bindgen-0.28.0-funtoo-crates-bundle-48aaab038b1b1dba1efc3e20014a9df4cdafc067fe6d22becfe2e3ed7e025221491643a8a3436023eed9ef9a57860038917ed4114675f01c29b76e7b085255ff.tar.gz"

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