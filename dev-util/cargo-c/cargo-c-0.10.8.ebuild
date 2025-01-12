# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/0d90bc5a47f2c37187545fe65efe37cc2f2647d7 -> cargo-c-0.10.8-0d90bc5.tar.gz
https://direct.funtoo.org/fe/8a/3b/fe8a3bfc972b3ce6dc6b4fdaec36b5c58f9888bb7864b5ff17ec38ece2f009a628ba7585f43135b62f0851aca46216758d8defd957782263ea84883af855092f -> cargo-c-0.10.8-funtoo-crates-bundle-7109104a6bd9dc39f2d376fc674e88ca2f8d1224cffbbe25e70b5ed042bd8115ded88927d3001f030f92c0e0a8b95a8c2f17a96994b91034d6b7d758db2fdd92.tar.gz"

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