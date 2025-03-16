# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/c6da659efddf1ff1c6e7322f72654f018907cc2d -> cargo-c-0.10.11-c6da659.tar.gz
https://direct.funtoo.org/bd/99/81/bd998151c39c8f7b2bae9db8bc0521e0f94e98bef81be25bbb327eabf190d0cfe97f4034457b303556b93b06a8db47dc2f091cd52030b2c8b7fb65b47c9d3a8b -> cargo-c-0.10.11-funtoo-crates-bundle-f1437164aa5bdb67df1e5be5a6b1336ca81401b2d40df9790b8cc7deb9b058a5ace7a87b68b131b3146983ebacb7ff12fa48f358dec3b5a5b3050a1f1d9024ae.tar.gz"

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