# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/56dfe34ce1281f6ae5eb5517f7cf03f87bec352c -> cargo-c-0.9.32-56dfe34.tar.gz
https://direct.funtoo.org/95/6b/da/956bda4bad5b93d49f08bc8d3c3e7a471a60f8ca27eb492a1dfa8305febab00454e908db717498ee5a3c4f34f218a01fcb1873f6f92e05fd55bc7b490745b29e -> cargo-c-0.9.32-funtoo-crates-bundle-527a7de3f9f6efd7b74d3e235037ff4c55b49dece56efb0da68947b0b56e0023985d9aa96a11f5a5287427ff28a9d8456499e8ae3d829df30bd67962cb23940d.tar.gz"

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