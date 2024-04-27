# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b140d7ca93d0ca734552866b205ac525fb13c67d -> cargo-c-0.9.31-b140d7c.tar.gz
https://direct.funtoo.org/34/ab/cb/34abcbcacb377b6eb522251b8073a581dea73663d7f6d45f6248f80166f9c3c9a554e22f306a6d20fa5506ae9afc61d041f682df1f4493f40df6f9e9b0d786ab -> cargo-c-0.9.31-funtoo-crates-bundle-7b8196981c94f235a47e9d2a6995cc82bbabac320845cc968a705a8a201844234ab6ba66d627bdd40815831b5255309bd36b9d6da3306099b42023c0b179b306.tar.gz"

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