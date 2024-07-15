# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/f8ae6f9ca7a90b34b12759921ccb1491ac2a7aa8 -> just-1.31.0-f8ae6f9.tar.gz
https://direct.funtoo.org/87/a5/4c/87a54cbc10cfdac059ae6e1c20f37ab74775ffdc86430539c0ef8318cd018540ef61ae22bd21717b060f83188c6e1e7731f3e6f763aa11458dfdd16540e29f6a -> just-1.31.0-funtoo-crates-bundle-907c13f42fbcd0c8db4bf6e84e5e7f183647c70abb002a220203c31c0f02240ed8435ca0bc185389fc78eb18e243b011966fdcbf09fdbbbc4934ff853bab43ca.tar.gz"

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