# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/3a2b7cfc1e9eb4fb9054d23dd816b59d10a2f49e -> cargo-c-0.10.2-3a2b7cf.tar.gz
https://direct.funtoo.org/77/05/ff/7705ff44b73aacc8c9690a3a11cbd0f990cbc9c2d2460015057d65d2e83aebee38c45dc8f87286c09b1c2286f09ab5fa67b973495af3dee5da035af845fa269d -> cargo-c-0.10.2-funtoo-crates-bundle-5b28103932c1cbfeaecd9eb703ea55aa199f436a01f57de0a2279541ca3be59cd0581b0374db26ef7ae5d498434a7df88f5a14cceb1bc820437626cfee76d196.tar.gz"

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