# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://direct.funtoo.org/f2/ed/48/f2ed4822391608c244b85e88c02473c9676865f507947452a27bcb726f9036bd2051e58c3f97fd2966524c0ed7afe3ee2176598eef008e49a3f07174d4460c27 -> cargo-c-0.10.9-funtoo-crates-bundle-ff3ffab37a9d244fa0a256462ffba094c4bafccdcfc9582ad6eb33e3b383f8b96ab596b59489760856dfd90e3282a6ee9c23878b237b3243ccebfbe2476dede9.tar.gz"

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