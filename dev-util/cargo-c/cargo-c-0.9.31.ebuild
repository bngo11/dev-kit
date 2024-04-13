# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b140d7ca93d0ca734552866b205ac525fb13c67d -> cargo-c-0.9.31-b140d7c.tar.gz
https://direct.funtoo.org/f7/0e/24/f70e240e999a5d4837bdade1a9439003fc348839670070f306988b57f4af8286664025356ed55301a5dea828a5436a6ac0c53020a9ee7cfc5ffc01e8017bb5bc -> cargo-c-0.9.31-funtoo-crates-bundle-0a4208a3440ccd7d160d032df2dfbb7c713b6448cb577c268e88f63eeeacd92c7ad2a9ea14330087e22b2052c67d36752a63eadafd703ca278b8901145df3395.tar.gz"

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