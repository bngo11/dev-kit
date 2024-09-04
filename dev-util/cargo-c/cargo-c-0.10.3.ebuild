# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://direct.funtoo.org/89/39/9c/89399c97806c213a7aad3e6601e7327caabde5c4e07560988f28f8cf15d6ab229c2dc7d6e30c3d9b93762e8823b8ac150352f98e15760e4776a68a1e7fba734f -> cargo-c-0.10.3-funtoo-crates-bundle-a06a88b9fea9caba1911dc79a06b3fc82fcc964980ee04237daeb83cf629c808f65ee1555d3c1baebe1c1ea434bdfa8ea75834ae66651039859e5fff94ba113e.tar.gz"

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