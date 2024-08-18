# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://direct.funtoo.org/f9/72/cc/f972cc69b652a659210818423ca717e55060f8fe6e4f0bd750f26e0e555bcdf17e170149bf9e93654ee3530cdb2b36e9249127348f2935aaf1c37a273e20cc5e -> cargo-c-0.10.3-funtoo-crates-bundle-adea46420d5dd225cb92c2e1fc6d9e67f3130882a2377e83f882c82824d1aedf3c1719f72ababe6b36c3bd97ee8e6e8fe382e5c2db7d394fcfaa10ae322a7388.tar.gz"

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