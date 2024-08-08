# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://direct.funtoo.org/b3/26/c0/b326c07f0814bb87c73eefc94da91361efb0bb24003d1807ec5b8c39e9d91a9353d5dc5c41fa87461942d157f08ecf59d5357b20d43abc51b30571732217a59f -> cargo-c-0.10.3-funtoo-crates-bundle-11697789810706fb6d1f85b86e8657268a1fedfc75ec98d03e68649816393f729d63cdaa035f216cfc560fcdb6ef96974ed64afe1126f1d89047288c421ac619.tar.gz"

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