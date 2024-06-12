# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/56dfe34ce1281f6ae5eb5517f7cf03f87bec352c -> cargo-c-0.9.32-56dfe34.tar.gz
https://direct.funtoo.org/0b/aa/f7/0baaf78bfdc87be62c08d2262885fa22693531fcce1dbfa86e361eab211dfbaf656adc8a4fbf79b0705d38a3ff7aceaed5ad184f78cecbfc26fe186f7c54e348 -> cargo-c-0.9.32-funtoo-crates-bundle-655a0b35a84b510ae366b6db817d46c75470ae29626ad96bce7b97a66a0a15cb9b2275f2aa7d66cc8978903ddeaa0328b90abdc0122f9628fda6b0496b3489f9.tar.gz"

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