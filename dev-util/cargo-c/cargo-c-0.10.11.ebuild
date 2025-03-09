# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/c6da659efddf1ff1c6e7322f72654f018907cc2d -> cargo-c-0.10.11-c6da659.tar.gz
https://direct.funtoo.org/70/ae/e4/70aee496d1214491c1816693f84de4637b0d39a361211a4cebdd65a488781cdd1192dda3901da766f364c8881b8d6a89f53ccffcb011d7fc14e0731018cfeae0 -> cargo-c-0.10.11-funtoo-crates-bundle-f7020288aeef6834070f6d2157a3c2f87413698eb7211d2e524619601c45ff9a431e6fee1c8e2b8d61528ba50fe79c514dbcf0636d27222a0d21631010666951.tar.gz"

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