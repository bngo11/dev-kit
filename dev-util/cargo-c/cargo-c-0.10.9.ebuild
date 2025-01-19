# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://direct.funtoo.org/38/08/1a/38081ae003e1dff5f8762488ccc4b34194743839b2d2f3a20e049e3908a1e52a566a75003aa32f2d241123d5f3ff1f0dcbfdefa72ae7e71175cbb1b9740d6b7c -> cargo-c-0.10.9-funtoo-crates-bundle-b42a97cf45978769f6c41d181f0ea77030497ea50a14eb126a50ef4c368377f730aa18f92d948597663207e516cfa04a6094ee4ca665f65d49bdc0b0af9ed879.tar.gz"

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