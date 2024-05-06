# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/56dfe34ce1281f6ae5eb5517f7cf03f87bec352c -> cargo-c-0.9.32-56dfe34.tar.gz
https://direct.funtoo.org/8d/b8/f0/8db8f092d694649077f3c257fc6c53c95ba7556ab5a5136c847494b7864512ce8a58b706cb9861f56161fc75263fea7d3438cbabd54c00b1f68560e05e6fc94f -> cargo-c-0.9.32-funtoo-crates-bundle-f8ce2771165ed8139fd225e89059837659b8160d399315d4cb960cfc2173b18f248e15c2bf4c6c4a753c5a6fd0dcd6307fb7e6e782c441b9682d90cb68972fc8.tar.gz"

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