# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://direct.funtoo.org/1e/63/ff/1e63ff51696be8c7b5cbbe06bd5de978d9cff27dc91d57b228a168034a812a5673faab8494a80d77ac8788f110216bda14b97278935f9f07716468fd0e22c64f -> cargo-c-0.10.5-funtoo-crates-bundle-deffe781171790463e49c2074150bea8b137126202bb5ba59c5c353feab5afac4812f597239ec246a1dadd0500f4551c407cc230ee54c335c9c48f0892d946e3.tar.gz"

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