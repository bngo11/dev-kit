# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://direct.funtoo.org/7d/43/6a/7d436a6b108a450bc39e88e77c9850e15745aa299d75b93cba70d32e1c5fc09bea605939b6d6dcb5a48ea58735e40b2af59c71d1b374dea082df224f53355889 -> cargo-c-0.10.5-funtoo-crates-bundle-3097d18143cccedb447a9553217a3ade333df1dfaabc0f397f16636492b574482a216a8b7ab8cd694dd83eecaf710fb965b5596e93f3b6052ad7c4dbb0cb1b03.tar.gz"

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