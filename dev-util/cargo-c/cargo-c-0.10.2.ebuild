# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/3a2b7cfc1e9eb4fb9054d23dd816b59d10a2f49e -> cargo-c-0.10.2-3a2b7cf.tar.gz
https://direct.funtoo.org/d7/b5/ee/d7b5ee521aafbfda53b3d15361cdfeec63a160ffdb9462da00b336fed8fa1f70596c3bb139596b3fee46702cad85bd15f2e5531360d87751465a65feb3d0da54 -> cargo-c-0.10.2-funtoo-crates-bundle-63015683bcfb9cf07f761e242753e218898074ac3537a114d28d61331e79268b4ef1d87e56c09a0f2c5bedf733b5d062f9ee7f7782b2bdce5200b4f3e0c95bc1.tar.gz"

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