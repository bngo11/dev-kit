# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://direct.funtoo.org/d6/22/4b/d6224bc0dde117da90ae72d545a1285597587b7aad564b6c4002b69fbbd6720af753321c7e2dcd2082794e598332342101f3077afd5acdb9d218ef554c380ac0 -> cargo-c-0.10.7-funtoo-crates-bundle-9b26f9c391d127ad52626b5dce54ca53629027289d9ea24875f288af7ef2dfa7e40cb55719bbae5aa23325beb46abb58fe6d2175e303b4553d400e5cc787c95b.tar.gz"

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