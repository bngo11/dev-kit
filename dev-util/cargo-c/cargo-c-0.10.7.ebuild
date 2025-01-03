# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://direct.funtoo.org/39/3a/d1/393ad11cd49dfecfcccdfbb5682ce9e110e7a1c752e2bd39be990ce8838c03bfa02990985d38a878e357c38e30cc435b457093e8d7b2d13f5f61ff81d0334860 -> cargo-c-0.10.7-funtoo-crates-bundle-565649ec41e6df6c95996480c9fcdab8b9584d533f43158dd0ef48ba477b11e2255aa2dc3bd5b1e34795e2fd420b322262519a05768bf15182966e36c225aeb0.tar.gz"

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