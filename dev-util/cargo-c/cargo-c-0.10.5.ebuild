# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://direct.funtoo.org/46/a4/a4/46a4a41e20ead301e388711fccaf0f158547b6f69a72c7efea1feb172a87490874610aa12e669c63c2acec936193bff2fa1ad62d378fad83828a8c555e5c5191 -> cargo-c-0.10.5-funtoo-crates-bundle-5e4dba6b8c031466f75fcbcb58bc757b7ecf6d3765385b834eb28b4b5d5ec7f183df8e52904a846054f6db3e60d2e13e26a5c3b7fc9c05cb57727e193103e2d1.tar.gz"

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