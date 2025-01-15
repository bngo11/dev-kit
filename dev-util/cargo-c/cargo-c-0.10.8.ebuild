# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/0d90bc5a47f2c37187545fe65efe37cc2f2647d7 -> cargo-c-0.10.8-0d90bc5.tar.gz
https://direct.funtoo.org/d1/b6/84/d1b684335406be98685cd7b78e18484a10b03f9369194ed29ef7c056f057475e5b9b4c33f7a17c8d36e99cf28b26a86d90ce3a1e4ccc02c6a35523fb8fcb8380 -> cargo-c-0.10.8-funtoo-crates-bundle-08f57c35e667b22b3551cb5c010e9f85797d7dc712a64756669680e541e675920705dd27e3e96b15715419638082b42aca4759a66cc7e811ff6d955ac2f5abc2.tar.gz"

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