# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://direct.funtoo.org/bb/8a/12/bb8a121851f0f9ca034a85614cb0bd519b88313292e619a6d912416a47c0555e22bb0ab5c9250f42f93ebe34d0b963758f6c232c40d719c60f1fddd4d0f00bca -> cargo-c-0.10.3-funtoo-crates-bundle-a940d00daf2fc1e030acfa3b63846ae7ba303a9d450bd6087b89410acf187e2d1b12209000a842f1112f6ea97e095f6cd73a485758b6ef491da2ec6bf947149e.tar.gz"

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