# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://direct.funtoo.org/e9/ed/db/e9eddbe110f7d4bc862ff524af6c278249b21b6978ee4a88771a648f3af565a9a58ac3054763649a4af705a416c708605868fb141ab760f1ee30bdfe6739665e -> cargo-c-0.10.3-funtoo-crates-bundle-f1187ecfda0c575b0e3137d8032a07fa635b102bdb341d03dfa3e4e73c7df8398c35254027fc6c75e7faeb2193fc8b11549221be40c9b76688ca4d4728e1a8b4.tar.gz"

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