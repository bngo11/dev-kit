# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://direct.funtoo.org/5b/2e/68/5b2e68b7e6d2501ec5dde002d115aa3393a19ae409598b27055d4a3b4e66a89427afdf4325e849dd01cb483937c053722fa6dcb809592c807bd8d0dc285a4b2a -> cargo-c-0.10.9-funtoo-crates-bundle-30cb1701030bd1a06c5c0f19e3e04d903e92dad56573485458ef2adac58182fef64171f6f852d17ad8b90a6f88a9ec33948cb584dc7bf6e60738d71a5a538571.tar.gz"

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