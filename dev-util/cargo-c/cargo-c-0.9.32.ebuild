# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/56dfe34ce1281f6ae5eb5517f7cf03f87bec352c -> cargo-c-0.9.32-56dfe34.tar.gz
https://direct.funtoo.org/15/5b/b0/155bb0847c5a345e1e17225a047041a4ef389da33f78810ac9e0206037db4d859caee353785bc711bcbf688d7ca6e25e4363b0f8e4453195745e53921196ebb4 -> cargo-c-0.9.32-funtoo-crates-bundle-02b31356a1fbbe1beb9fc804cc3538b27239ee63ae569c18a066e27e7f555f84aa27858720b677107bda75450aeecb0d7e47a28e2dda2f7968c36a4d8e596b0c.tar.gz"

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