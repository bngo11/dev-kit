# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://direct.funtoo.org/e1/19/11/e11911113e4e24a97272586d4c7136115cebd2bff3c2ea97f0e9488e04a51282ff7b35612e4eccf35498cbb34e1c8e1c8b049a5185378096954f05b41dfe53d9 -> cargo-c-0.10.7-funtoo-crates-bundle-ca090c25b3e550c74ba18aeb12bfe3c217d0b7e4d5cac649501dcfb1107708c563607cef58084e3475822c7d1336f070b111822a71e8d43a0025527872cace48.tar.gz"

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