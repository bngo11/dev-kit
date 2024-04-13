# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b140d7ca93d0ca734552866b205ac525fb13c67d -> cargo-c-0.9.31-b140d7c.tar.gz
https://direct.funtoo.org/69/65/9a/69659a4abb89cdb3f2dd8846b36e475bc781a8b98e8f44942737190de63701f436304613efe4d54e7553fed7d7a918d9fa3acdd0b91a76976a572c27cef034ba -> cargo-c-0.9.31-funtoo-crates-bundle-bc335bece422f4f21accc97bc4021d9f8620aea949f136c18f020c041c4c1e0b16352a3832ea92dfd8ae31a9a0a0e48941bd9c5d2fee76d3e1f976a3c598f387.tar.gz"

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