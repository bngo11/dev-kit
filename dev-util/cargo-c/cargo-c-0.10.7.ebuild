# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://direct.funtoo.org/5e/20/a8/5e20a866773faac76a413378aa3b59fa9624dc7395719abcd0349b1378e689b98904d6f348c369892ae75ca357d02344137001a89af0ffbdc3a3b8eff4eec3fe -> cargo-c-0.10.7-funtoo-crates-bundle-87eb1b57ee260d608dd9341bdfc9df97c3d4023a4680d100479318b0e89d0f4954c68fab3b982f6a58762cf895b11f198e2ec63ad60b31299a38a8b2abc8dcca.tar.gz"

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