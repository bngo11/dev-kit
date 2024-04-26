# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b140d7ca93d0ca734552866b205ac525fb13c67d -> cargo-c-0.9.31-b140d7c.tar.gz
https://direct.funtoo.org/63/89/25/638925e89f4f87c8dfa3f2d8054f376c32b3028d7bb2db4092192136061a7e4ec7f1ef721a652b8c0519cf2fdec66a6180aaa23903e198d3efd5db8cb44077e2 -> cargo-c-0.9.31-funtoo-crates-bundle-f6821fc4bb07fb454aa0814676669d28331f5c58f849a1272cd4d99689d43d9cacea71d7424f4da75148728124b1242b0165d35e351627778984c19fd51bd97d.tar.gz"

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