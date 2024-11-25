# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://direct.funtoo.org/74/45/ef/7445ef9d38ea6c31d811a72a09d60e3be181d7902dfd42ed76ac3f91a3e2fb2ecee2516dff389043940683b70ef1377f8687d96701c9df49f0c890c63fbf0740 -> cargo-c-0.10.5-funtoo-crates-bundle-70d395059dc17054831bce8facb105b569d3bb65dbfa1b1a3bdbab58343c5f96d7b7c6656f4fc202340831ff71014e58358c4586b2e29af38f406c16c709b150.tar.gz"

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