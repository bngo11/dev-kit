# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://direct.funtoo.org/d0/fe/24/d0fe24945d6fa46a5413425d5ab2954c523100151a756f632c633bbae76edd227bc23473f15e34969cdf8c90b5d87311a6d1a4d3408bf23545f9db78f90e48ae -> cargo-c-0.10.4-funtoo-crates-bundle-70f2d9724f5af6ffe340929680a26a10ddba773adc86ede762675bc26ee5cce24ca3c9fa2a997499944d01f02a3c8407f95dbec535db517539ff224bee7f76dd.tar.gz"

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