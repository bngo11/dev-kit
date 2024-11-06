# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://direct.funtoo.org/87/0d/30/870d30e76586dcb9a0ddbbdfebb655a2332bed92eb07461fb30683a6b3f64f91a9aa6b40c917d17406054f3cc6a9dea633be82625397b62160cbc2e5ebd412d9 -> cargo-c-0.10.5-funtoo-crates-bundle-026d3fd3a1ff79bef85963d9d3ff6818022b49ed29eb63c8bb096d4a7cf35730c52e4be4b918e8e73ef27f7fa2efcdb3d360ed1de1a4a488337cb21b545c1803.tar.gz"

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