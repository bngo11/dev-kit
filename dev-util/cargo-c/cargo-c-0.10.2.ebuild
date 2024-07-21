# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/3a2b7cfc1e9eb4fb9054d23dd816b59d10a2f49e -> cargo-c-0.10.2-3a2b7cf.tar.gz
https://direct.funtoo.org/12/63/2f/12632f47621d6946c2208135faedea032e1d9e967d3df75f75fa3bbe7fb456d62f3175ffd2865860841ee8a27b2538e1fbb2ef061fe43e823a3c239100edfb0b -> cargo-c-0.10.2-funtoo-crates-bundle-052f9e411cf13dc95a1724a77364ea5401947520a525ae08a6dd56e359fd38846e05b8fdd560587789131b313fdf88f626ed1e40b0368d099c07fb406a004c1a.tar.gz"

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