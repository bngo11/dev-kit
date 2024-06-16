# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/56dfe34ce1281f6ae5eb5517f7cf03f87bec352c -> cargo-c-0.9.32-56dfe34.tar.gz
https://direct.funtoo.org/87/07/7f/87077f06740aaa600f8173b6b63a3c4758d2b68e7af399d898a65d7ab07f3b206b5423ffb7801b823241b1002491a960337c21f55661d94e008cfcb7561cefbc -> cargo-c-0.9.32-funtoo-crates-bundle-f09a0881a2016f11d718a0dec2411e15a18fff9bc7124b753cadbdfcbea3856f2d1a220a58d8ae084b88aa2338255d694b2891e4d276c13e23b5a71cda0ef722.tar.gz"

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