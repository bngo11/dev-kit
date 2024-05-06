# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/56dfe34ce1281f6ae5eb5517f7cf03f87bec352c -> cargo-c-0.9.32-56dfe34.tar.gz
https://direct.funtoo.org/88/d1/e2/88d1e2ffcea564f50a56d2363062e09cd4fa0149d2804d87854f0503d6e50b0993f3423eeb7eae61147f6b2d64e817127458bed109ca6452c930b171d8c32e8e -> cargo-c-0.9.32-funtoo-crates-bundle-5ee13fe95ca73e82a691c9db44cda7a1e825efed37b2e65edf8ec7d51dab86a487f42a7310eefa89dc820efa5288fbb47a3f167d70350668836f4a30106cab61.tar.gz"

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