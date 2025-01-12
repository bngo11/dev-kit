# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/0d90bc5a47f2c37187545fe65efe37cc2f2647d7 -> cargo-c-0.10.8-0d90bc5.tar.gz
https://direct.funtoo.org/f0/05/e3/f005e3a45adf402b2bc0f8dfd747a5bb6bd0b95907852d4eefe889837d1921aa0db68a1ed99b1c2eacdd20cb769ea07f895a99654957327050ca30031ad04393 -> cargo-c-0.10.8-funtoo-crates-bundle-8352a25d97e06316644906f9ed8aaa019318451abfc4c91fd5db75193461e60a3c890d3040d70d984484fad31e41d4a17a7935c28ffe45578d347627fae1727e.tar.gz"

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