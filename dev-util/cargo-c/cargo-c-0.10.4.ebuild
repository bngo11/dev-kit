# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://direct.funtoo.org/54/d5/18/54d5183cfe6029952a0ddb2433cf66b540bf33b8f3b1585b78bd6b9f181deaa5d4fd74cbf5357b099a4e6b590bdbd33401ac068ebaf3518236170c51da9567ba -> cargo-c-0.10.4-funtoo-crates-bundle-f14ea58aeb5fb08d2ffa91cfca3060e0fc3e360a0838fc04d2bb830eba3c5e947382525c4f0a1daad0329cce2046840d5c77f65b8df4687d9089ecfea4f78dfc.tar.gz"

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