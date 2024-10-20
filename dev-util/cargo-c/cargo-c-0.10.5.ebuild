# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://direct.funtoo.org/57/4f/03/574f036a2b8e373dff817247a76cb3a763e801d814a8d83427e1eb375182ce06b66286f1d9565e81f636ade5329192bbbb89bd295aa753c4b7acbfb5663e80b2 -> cargo-c-0.10.5-funtoo-crates-bundle-75eb4802d68d38c7e29875c8c1eb883be28d7c922891de96381cfac7ff031656f392751d87430d69381574b6f81d360f8d480eee5679b35786b5f494e0439d38.tar.gz"

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