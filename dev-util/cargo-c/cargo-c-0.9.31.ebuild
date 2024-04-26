# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b140d7ca93d0ca734552866b205ac525fb13c67d -> cargo-c-0.9.31-b140d7c.tar.gz
https://direct.funtoo.org/29/81/bd/2981bd7409973235601e8403e5c0eff95e9cec09e0dd0917b83d793d23b8e3854f806e77a654c318b7c1dc3a0de5a3a4c3853fd33971e8ad33b3b83c5732639a -> cargo-c-0.9.31-funtoo-crates-bundle-5d50dbb99e6362d5343dbd33ca23a17274d2b34bddae9e6ddf37ebb7fc7e83d012ce799d5b59d48f1fe13193b7d10ab9fe580b913f663a3c939d1ec7c11d3b03.tar.gz"

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