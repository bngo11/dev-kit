# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b140d7ca93d0ca734552866b205ac525fb13c67d -> cargo-c-0.9.31-b140d7c.tar.gz
https://direct.funtoo.org/5d/39/4f/5d394fd7a29b0992e99f3dd2fd938483d8447dd034e9f6781aa77e2a3d415f8b9189ed8784d7a1d9962c1a47c1c1d1a35bbd923c09cffe553bcf2b17b36971dc -> cargo-c-0.9.31-funtoo-crates-bundle-3f50318fd71fa8a00aed459d2baf242ffd3571a9fba03d47e8caaabc3d2d863953f491086f62bdd65aaeb7f7256cb2c2c1bc8af8c7ca272c65815cc7b1582a8d.tar.gz"

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