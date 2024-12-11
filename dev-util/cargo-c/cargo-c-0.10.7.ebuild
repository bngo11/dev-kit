# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://direct.funtoo.org/3a/cf/2e/3acf2e04dc67b6bef6f77623ee42450b851bd16fe432ce0fd8ecc286aeb5841497594bb0e6e589e2df00affc73347e5666084648dfa51005be2bc2ced131e307 -> cargo-c-0.10.7-funtoo-crates-bundle-4c69bd8a658b39948f89577b764fe7a5f796fadaefce5cb699b46961bd850462af975768b601c4f3ab5518db1d6bbb8debb12ae7e82da381ddd00e7421f3ffa9.tar.gz"

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