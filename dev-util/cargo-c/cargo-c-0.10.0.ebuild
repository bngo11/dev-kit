# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/62e72d44915675b2678f32e701bc1503d32881bb -> cargo-c-0.10.0-62e72d4.tar.gz
https://direct.funtoo.org/a0/c3/f3/a0c3f39d396f1f6c932236577bf0d0068de54b53913371283da383263162f668eba8ac06f07aafaa066b45cba523a2c2dce58da4d1f4e3b15fcd2f070e81b3af -> cargo-c-0.10.0-funtoo-crates-bundle-9f94aded89d2becb3d527cd3139c0db778700c2839344332d1e9316fd7dd81c8e0fe4e01dbf4ba06e98debe289211137d568e3d44532e3816cfe340547e272da.tar.gz"

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