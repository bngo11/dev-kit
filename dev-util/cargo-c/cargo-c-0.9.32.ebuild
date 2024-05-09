# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/56dfe34ce1281f6ae5eb5517f7cf03f87bec352c -> cargo-c-0.9.32-56dfe34.tar.gz
https://direct.funtoo.org/c6/a1/e7/c6a1e7abc8262e00d17f257de9380de0d0f72a55eb4d4bfb1a5fee151d16678bd40ae21c4994a15d790a416c4307ea1ba3c64e061afc56b0f43b9811e077c43b -> cargo-c-0.9.32-funtoo-crates-bundle-a30965f2990b8c3da9c5b10f65f8038c8f820d95884c252b5b1a4227bde039784fec8399df518fb98b32522579a7f232f3b8ea154c7b0e5c15253108bc6fa34a.tar.gz"

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