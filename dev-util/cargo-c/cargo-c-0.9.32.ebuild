# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/56dfe34ce1281f6ae5eb5517f7cf03f87bec352c -> cargo-c-0.9.32-56dfe34.tar.gz
https://direct.funtoo.org/1c/36/3f/1c363f203fcb04d28f4d9e66f0e454f39534e638c697e9cf645fd5801d90f089ef7bc4868e01a847791a59cab8d6be03df801b55f7a5aef49376408a936ae387 -> cargo-c-0.9.32-funtoo-crates-bundle-556e0432d077ca6975acf1725e4d6a3c64ecb0292e6ae2ef11e134b8afbfd56087db8b07f5811ad306e9a79a7449be05aacabbe043c0e9b448128f6348d1e93b.tar.gz"

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