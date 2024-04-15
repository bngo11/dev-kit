# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b140d7ca93d0ca734552866b205ac525fb13c67d -> cargo-c-0.9.31-b140d7c.tar.gz
https://direct.funtoo.org/df/19/c8/df19c8515c2d86bb70ef4d2b904cc6b8a96127c255f49991ba5197c15c18b15d3c08235ad2ebd47b727f162b3b47a59b63514431649c39376198f1b806d06aa5 -> cargo-c-0.9.31-funtoo-crates-bundle-c55896635b83aece6009f675d9bbf39013fabc7a2a901704d7bbfcef18b7afb750be11c610286c93ea30e7b998baad618e0ea478d41cdac096651a4be035d8c0.tar.gz"

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