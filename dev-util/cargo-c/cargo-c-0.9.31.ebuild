# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b140d7ca93d0ca734552866b205ac525fb13c67d -> cargo-c-0.9.31-b140d7c.tar.gz
https://direct.funtoo.org/c5/20/59/c5205958d306ae6db19523f3193b5c0403c7e339bb7da4bc75fcc48c66a0ed4d60036ace7a2224354e59c4b23865f0195d557453c43375a172a23717ef863585 -> cargo-c-0.9.31-funtoo-crates-bundle-8e9c12e87e14015a459610ed20834365cf92e1627ef0fd55bde0028b4d2f9e23706bab9b36906f10190dbf6ae3673350b9b07b015cc7012aca52baea60e080b6.tar.gz"

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