# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://direct.funtoo.org/c0/bf/63/c0bf63bc4f694ac02489e6df91bc715662835823736842307789ae0b4b52b8c45b15ba96873cbe27609334327a3e25d2c71e6b7723545a2791c3f8d1dbc757bb -> cargo-c-0.10.9-funtoo-crates-bundle-9a732822672cdfac696bb6d5f83a12aee24a05b60dafada44913b08be2ac891c01237226e64b386f4d3e892bf3eacb32ef89a79ec56938937c97ea33068218e2.tar.gz"

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