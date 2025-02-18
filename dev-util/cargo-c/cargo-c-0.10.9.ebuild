# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://direct.funtoo.org/d2/56/d1/d256d191862fdd78a573c5ae45eb6265cdb7cd50223d6cb267bddb56e4cd7698ae4d1e7d7509f9c299691610eeb98d27dc720f5a2ecde52f4cf33a98c990c97d -> cargo-c-0.10.9-funtoo-crates-bundle-c3179fedf43e9e639bfefe58a31fd1a772800d4d3ee3151b66b609a061604755eb79e7a428c19f5a7b28f594c8caf59a094725ee2b2667ef68861ebbe40698d9.tar.gz"

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