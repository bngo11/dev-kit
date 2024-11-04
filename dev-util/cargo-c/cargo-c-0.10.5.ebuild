# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://direct.funtoo.org/ed/0a/a4/ed0aa4198c26ed85273596ae6b0d742ae43ffd0229b4c28dd9d53a10923b8c7e2f1a6969490b03004363bb7bf7e2a75ffe4040ef84424b1bbfd4375207518435 -> cargo-c-0.10.5-funtoo-crates-bundle-18118b9cb8754bf065459790d5819838c0aa526917de9bd2ec3c5f974a9feb3008d903d58e36ca611235ab83b15d0a007d70c5262d082acbd7ecbe96fef0babd.tar.gz"

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