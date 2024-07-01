# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/3a2b7cfc1e9eb4fb9054d23dd816b59d10a2f49e -> cargo-c-0.10.2-3a2b7cf.tar.gz
https://direct.funtoo.org/8a/b6/72/8ab6723628644c1690eaf11f77b7199a994bfa1135b149391cec70200e86ab00fa79457ca8961dab0309f1294bebb656222b5b791520b7a5102b0afcd9c55327 -> cargo-c-0.10.2-funtoo-crates-bundle-b71ea9eef64bbb4a16365504e9d0aa76152aac20c6e6c9ff79839e690c3312d5aa76ac033c7e0531485d81842da28bf32083ed816c9b913f06b9b2cf0833f797.tar.gz"

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