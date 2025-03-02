# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/c6da659efddf1ff1c6e7322f72654f018907cc2d -> cargo-c-0.10.11-c6da659.tar.gz
https://direct.funtoo.org/d0/7f/26/d07f26eaae8426b472cc4946ecd2524798006efd1af0d95619b14837ab6a32b3e83940dd104c0ab4abce5f6143de26e2b4069d0fc8646bc46303b20a025557e8 -> cargo-c-0.10.11-funtoo-crates-bundle-2e063dcf989d2aa0bd0344437581a886810cb8be0488ff1761821ac0bb461b48003323e15bbfa6d3edc295d9dc78f04f0288487a3d15c6d7fc760484edc68122.tar.gz"

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