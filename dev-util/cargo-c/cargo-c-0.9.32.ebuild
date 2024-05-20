# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/56dfe34ce1281f6ae5eb5517f7cf03f87bec352c -> cargo-c-0.9.32-56dfe34.tar.gz
https://direct.funtoo.org/7e/9c/5d/7e9c5dc7c00aeb0cbee99d03ad87216c22f5ce6a23a586759ab265c0c770ab46088c1362c6299e45c6c56c42f72b2a590d79bc556fcbe52d8750924a6c1ae7c8 -> cargo-c-0.9.32-funtoo-crates-bundle-68603259596953f2fee923fa5667302b76d6dc5f57c95b529ffe4edcbfd67f123c3bf0926a8739904d597c7b0de384c44bf00240e771335f8e75dd8af6d54073.tar.gz"

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