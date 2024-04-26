# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b140d7ca93d0ca734552866b205ac525fb13c67d -> cargo-c-0.9.31-b140d7c.tar.gz
https://direct.funtoo.org/07/33/4f/07334fb9ae6d3151e98d88a368c2b222cdf3c3c5edf4bffb16bdea41b19d2abba860d0422badbbdfbcd388c985509597352b8bb96ba0032e6d7f0d0b9ab708b6 -> cargo-c-0.9.31-funtoo-crates-bundle-964e3e9cf14fcf03d19c820e9b9bb8d633b99b2791d99887ab0f32fa55de8190da65968a9d4d320f4320b04716155c6ee36626acd6e97efc380751c200817a19.tar.gz"

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