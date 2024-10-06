# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://direct.funtoo.org/e6/a6/7f/e6a67fd9f0ba1b16783b5fe243ba3da396aa80854f54ea0e71c3367c541ee77eacc90f50d5a24a8a4fb6f4ab13f85881c7690d540efadd15271ee93029f6ecfa -> cargo-c-0.10.4-funtoo-crates-bundle-8ada135a127addda0d4d4220560f7aae7645e393f821db496f0489f1f952d3bbbed1f3df78102c97c271377c3fbaa151072f7756add2381fa95c475e18376776.tar.gz"

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