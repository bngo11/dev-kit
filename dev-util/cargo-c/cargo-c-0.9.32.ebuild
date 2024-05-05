# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/56dfe34ce1281f6ae5eb5517f7cf03f87bec352c -> cargo-c-0.9.32-56dfe34.tar.gz
https://direct.funtoo.org/55/34/5b/55345b890e6c17719b4771e9b67821258308bf3a69daf9a853f9cf9fcc43196531362ea64898320b74783a1c075305540816d01ac40b1c1820fa52b715f61bd7 -> cargo-c-0.9.32-funtoo-crates-bundle-c242d6a7f85c703a73b49b0fe8c68b032c8937bb4f7ec9a32be62e630d8ee2847d2783e3e237c25a6f1a7dda68a6df44334fc7d1289c75075062362da5906e9a.tar.gz"

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