# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b140d7ca93d0ca734552866b205ac525fb13c67d -> cargo-c-0.9.31-b140d7c.tar.gz
https://direct.funtoo.org/86/a5/97/86a597a140f1c0efafd9a454e1c1c966c585278354b3548d8a8284b5f7daa94958c4f38ed317262dbfb8943c0308f87d0c2a22cb161032a106d2ef76a68f83cd -> cargo-c-0.9.31-funtoo-crates-bundle-eeead9a1adfe5bfcb2c8f10b5b01d1175834ddd4eb19da41d984b49ea10305c7a781903baa40d8e444003999d6fcbf2cc779ea4d755bac83028c473c126258e0.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="sys-libs/zlib
	dev-libs/openssl:0=
	dev-vcs/git
	net-misc/curl[ssl]
"
BDEPEND="virtual/rust"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/lu-zero-cargo-c-* ${S} || die
}