# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/d7530257e87cdd067d0faadc92017f63569cfabc -> just-1.38.0-d753025.tar.gz
https://direct.funtoo.org/9d/dc/b8/9ddcb81291db0fd06e084d811eaf0b3cad515c2e972419a0e1c8c71165d139342615ded86883aaba4875edc3c2e6ffedb3bb270fba054c1c6153f7ffa7e622a6 -> just-1.38.0-funtoo-crates-bundle-07fdfad449e574d41e682d6246c343de37bc5638066c91e18eaf07fb4a305ab0d1a81dcb2c821079e07416b9b4eccbcc0b2b4e87bb412208332ab6df11eaf52d.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/just"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/casey-just-* ${S} || die
}

src_install() {
	cargo_src_install

	mkdir ${S}/man
	${S}/target/release/just --man > ${S}/man/just.1
	doman man/just.1

	dodoc README.md
	einstalldocs
}