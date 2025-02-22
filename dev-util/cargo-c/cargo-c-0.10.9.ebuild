# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://direct.funtoo.org/71/3b/91/713b910c11e4d4416dae09c19565b2b58665355f7aef7f8aa45e383651abdb9b5880ff72018fba74bd598061e388880356f3394072ca2fd8c636877268bc4d67 -> cargo-c-0.10.9-funtoo-crates-bundle-6b9e15193bfa92a228634e6ed53e755cfb9f5dd240d214f6ceb960d1bda8254897c5f0f007cbb3ed98cda4e25dccaff5482892372b967015a77453ab1053368a.tar.gz"

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