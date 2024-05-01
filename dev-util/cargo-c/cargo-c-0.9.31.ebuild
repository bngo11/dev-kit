# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b140d7ca93d0ca734552866b205ac525fb13c67d -> cargo-c-0.9.31-b140d7c.tar.gz
https://direct.funtoo.org/e3/7b/4a/e37b4a7df618e82e9cd5e0dc5a9ba5eadadb02cb0a76fa845267610cc8cebf6330330b4e26b5956544b8885a498206c346863f4751e42a4fb4e9327bf00361d9 -> cargo-c-0.9.31-funtoo-crates-bundle-41af99fc52d566f4fd6f02260877274f4953d5a94c046824f2a662ed44c81fac52cf8d640447441fc60ae2c152bdf6cb56be289fd1c386de26179308c284a4ac.tar.gz"

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