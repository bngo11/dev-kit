# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b140d7ca93d0ca734552866b205ac525fb13c67d -> cargo-c-0.9.31-b140d7c.tar.gz
https://direct.funtoo.org/23/f4/0c/23f40cf544b56d47ea42e93a27209de617fa232257d613c25fa48788e42ebd58263ffd922ea00b22ee5ef6bcf036042357244a5aa7bd4980a4ce01f76e06cc58 -> cargo-c-0.9.31-funtoo-crates-bundle-2c910d82de18597f7cb7bcb4904f74ff0bfdc69f9a8dab8f2112471c0504125c6668ce4fd1d78ad4ee267d62e0950a2c77337fc9a39d52e9e6ebab79948fa3d4.tar.gz"

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