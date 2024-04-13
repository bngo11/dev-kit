# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b140d7ca93d0ca734552866b205ac525fb13c67d -> cargo-c-0.9.31-b140d7c.tar.gz
https://direct.funtoo.org/2a/3e/ef/2a3eef8120c8e2c9b075420759d41764a58bb254d6499bdaecd59983b246877e3735cec4f3386c5f32521a9186b1323b44ed3dd351e48ecab913c8ea1c397eea -> cargo-c-0.9.31-funtoo-crates-bundle-0cdca9e1ffaf4b2782c0b7c53c9e155e2167a34a8cd070ab288e7d99ba428792abb1bf757b6a6c8d7473b6cd93f5fe5eca50c42b2b4df7e671e6b4891ae6ac62.tar.gz"

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