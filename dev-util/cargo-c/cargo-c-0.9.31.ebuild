# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b140d7ca93d0ca734552866b205ac525fb13c67d -> cargo-c-0.9.31-b140d7c.tar.gz
https://direct.funtoo.org/38/b2/70/38b270df1465cdda92531da5e52e2b5d562df0f3baafb71ecac6396d1a99bf7fe957906c06d3b7b7648b0aa9073e68d1f866cb36f891e3eb03d562dfcf3ff11d -> cargo-c-0.9.31-funtoo-crates-bundle-e0c80d2bb9153f38d26a1377e446412079875df6f2be6513f8fb00a592c2e4cd71886f3163829c9ff0b813db6587a9b30ab9d4f67120be7c67a614e0353387ed.tar.gz"

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