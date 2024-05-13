# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/56dfe34ce1281f6ae5eb5517f7cf03f87bec352c -> cargo-c-0.9.32-56dfe34.tar.gz
https://direct.funtoo.org/3c/1f/cd/3c1fcd3165407689d6d03fc191622e9a753ce58102598c7739caa7ba4546e046f65c092dbce02a1deeccab0191151424b3e51f53ddee8380dc13dd361dc9af63 -> cargo-c-0.9.32-funtoo-crates-bundle-3caadbdf86994dc9b3a65607817abdfaa6e7c82ec9ef821aba592cff762939473a57c06b7b97c939a238dee01a089107618d2d03846a398c7dc98dedf24202ff.tar.gz"

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