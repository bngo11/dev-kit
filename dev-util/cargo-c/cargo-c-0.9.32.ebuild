# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/56dfe34ce1281f6ae5eb5517f7cf03f87bec352c -> cargo-c-0.9.32-56dfe34.tar.gz
https://direct.funtoo.org/fc/df/74/fcdf74a7343c304a20a0fc11acb11d801abfed48bfd2010a0de0f77c5b027c3cb99452f6c53566f4307938036a396200d171d972d640797a037dde81dd040349 -> cargo-c-0.9.32-funtoo-crates-bundle-9896a9ff5028496848762d6f7d78f4dad45e79748dc5604eb281c1c88191714b92d79a5791c9087b6ec91c55144577a9f86ded7330de63ee9d5bb51311e77789.tar.gz"

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