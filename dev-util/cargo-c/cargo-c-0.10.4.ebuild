# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://direct.funtoo.org/d5/03/a6/d503a61961c3e2f536affea9750839614ff0943c44fd7d74abaf824a9f673a37aa3d844240ac52ad1eb6daae2be5fb81b37d15fed5ff4773e9c33461bf263739 -> cargo-c-0.10.4-funtoo-crates-bundle-17afa759bd2f589bccf897c390da43d10cc1ad5bfa1d05bef0038f8f2f60f1f34780d2e7e5383eaecc80532df5b6473b1954d354be0bc2d4292b93738507fb83.tar.gz"

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