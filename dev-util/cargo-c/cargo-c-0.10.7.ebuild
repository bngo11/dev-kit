# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://direct.funtoo.org/13/39/48/1339485bcb5c55045d64f3b6df94e66f20427787dfe8188e72b76dee46d77cd9556e339d273e103760d2792facd9871c0bfb785483b4bf933f40243e237a8cbe -> cargo-c-0.10.7-funtoo-crates-bundle-f792dec1797b5088a74337f87b9955810250b004093c1b2b9bc32cdd5a9b4f4bfd3d405b5afe0391bf85cb64e329a0687de67c941e18725c65738e266b922d43.tar.gz"

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