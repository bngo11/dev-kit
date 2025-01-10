# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://direct.funtoo.org/bc/b9/1c/bcb91c870c7b01cb7d4e485fe2db182eb49bfc2083db11075754986ec3f973001f75232898d2c33593181029d5fe0b1ff1861c80fb48c46ae238126d23a3d2f9 -> cargo-c-0.10.7-funtoo-crates-bundle-63d0f68876faf48bac7785da5ad8e9a81540b046b240fe8fd8624ec3d29ae42bb8dc4a66a80ffd3588391f656100d046ffa7ca3388c7b389fa363283f76a1de6.tar.gz"

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