# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://direct.funtoo.org/83/22/31/8322318383d5eb4a68caa15026ad0037b265b3c8bbaa757dd0275340947cae5639950cb6a78e6e3efea50289a59bdeafba981c2d9af5fcee902311cd805b4761 -> cargo-c-0.10.9-funtoo-crates-bundle-f4d31f801f718f4d1beb563fadce4b15ff97681421ea70e88379316f0d32b971040db56eb1eb8a821be1cfc2dafc2170531e684318009c9cd0bdb948f0191d41.tar.gz"

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