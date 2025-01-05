# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://direct.funtoo.org/18/7a/16/187a16e4c791edb32d6c92c42afd7b87c21df363ed168220e7dc5839985c799a79404efe5d4184352e360215973797523edd7a23d984a295840408b82b1a801f -> cargo-c-0.10.7-funtoo-crates-bundle-6cdbb4d61af4c6d56df2f48515a8c427540882a8c91775c0dbdb785b3e2eee7cb78fc0c842e32534856aa16d310171120a71965252260bfc4680d34bed685166.tar.gz"

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