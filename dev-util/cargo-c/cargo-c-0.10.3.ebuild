# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://direct.funtoo.org/e4/4a/e8/e44ae86763e5be9d4b86e5b939a63548fe483b52a1cb3789c99cf603a5a3317b5e482c904a03625a8788de74016a6ccd26980a5f088946eca02db7ae31838bd0 -> cargo-c-0.10.3-funtoo-crates-bundle-d413f32a4dbbffdee10fcd508a5c2f0dfdd1d44020787f9af424dea22641f3ce39549a2e1809255598f966ba7594e472b9eb1d81586c1ff1abaef3468db6257d.tar.gz"

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