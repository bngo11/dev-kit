# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://direct.funtoo.org/3c/ae/1c/3cae1c38ada93b2b2eec3ad762f4badc382732c0e67c616d5777fe2a76193bb7b60f25d53fdcb4bfdeea538d468d30901552b1ed632ebbf0d1edb287dcc303f0 -> cargo-c-0.10.3-funtoo-crates-bundle-8fecbb5a93617ac083bac7c6def0a278867c58c5962773ee4bb1fca402f06f3bc10973612a47118a16c6f96df3cac533f41f8f311ac489b125099f2b96d748b2.tar.gz"

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