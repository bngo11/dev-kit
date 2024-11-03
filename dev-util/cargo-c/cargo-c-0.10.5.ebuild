# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://direct.funtoo.org/9a/75/bb/9a75bbb3a4084332273e8871d643ad9d8fcdaae5771bcc8a0dbb15d1854c2f765c039760a45531bcd066790aa140474e77075d54efa8fc5b7e666212e01749a8 -> cargo-c-0.10.5-funtoo-crates-bundle-48fd3d1159947bab44a1c453a015cb17f8eb5cdbfb5a242d1ade5d462ddac0fa5f7cd868a373166619a93654613a5994f06cd91b96758ab7a6a65e5a807224eb.tar.gz"

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