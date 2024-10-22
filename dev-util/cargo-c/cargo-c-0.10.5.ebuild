# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://direct.funtoo.org/f7/57/87/f757872a8c692a99c619a25341c9d075a7e27c70516dbd51cd564450ab436c6365295ce3b384b90b2ab6957a67dcbc7da05341de4f0e2036cd1ed0b3e2aab35e -> cargo-c-0.10.5-funtoo-crates-bundle-a24ebd888532b9616950a3ea65436543c8e207f71fd013d0a6b01595eed3207433af5d9d76f757670dc495c2b5a886d5f5836cdcab84046e7ede17bac1b4ed4a.tar.gz"

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