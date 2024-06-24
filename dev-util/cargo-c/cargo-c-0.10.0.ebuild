# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/62e72d44915675b2678f32e701bc1503d32881bb -> cargo-c-0.10.0-62e72d4.tar.gz
https://direct.funtoo.org/94/f5/86/94f5860963d77f39d8bc26ac1a9c2ee73250ce87d964b94d5ddb6e01c7f183f630f3eeb1e1d5cc79e16dbbc2e1c9f3d21d5e2546d386cef1cccaafdb1b15220f -> cargo-c-0.10.0-funtoo-crates-bundle-528dec95311096daf7c5c437c46dabc36b7e0ac6f7bbd95c79971cb04d9b4bec77a14d95a4b11bb8b13d75308bcd587d6cfa81286d93036d0e6c689524a1722d.tar.gz"

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