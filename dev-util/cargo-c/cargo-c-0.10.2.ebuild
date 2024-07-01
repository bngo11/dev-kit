# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/3a2b7cfc1e9eb4fb9054d23dd816b59d10a2f49e -> cargo-c-0.10.2-3a2b7cf.tar.gz
https://direct.funtoo.org/61/8f/09/618f09e79fc7a6f69105c118049fddc73d6d6b37f4dbab66b2633035967f853052a3c3aeea5f594c360b882a6f5d89c2bb349792d9b7257d599773ec42ae11ba -> cargo-c-0.10.2-funtoo-crates-bundle-ff47b169b7e8850ef1f1b6782ddad635a774437f2a1faad34796ab2fb6abf7ddd66260da1e5da05c7cc153bc30998c30993538dc94bf14274f714d49bf9beeec.tar.gz"

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