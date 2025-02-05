# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://direct.funtoo.org/23/f5/52/23f5526e83c0ecb993962783aed6b636f974b53ce7a50e17b0b9bef3fce403ef24afc749d5db85dba101ddd5b0acde68bd64b9225747876cad21ad146bb46e76 -> cargo-c-0.10.9-funtoo-crates-bundle-4a0c708e27054c15300325a4edfe16e88b634ac792ed2f98fe6adae504b646c2c201435960369a38a171de96e4ebb64ca86faaacae53f25b9fa85946dd12d5f3.tar.gz"

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