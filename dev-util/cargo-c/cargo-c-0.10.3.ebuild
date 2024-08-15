# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://direct.funtoo.org/8f/e3/89/8fe38967f60c00986a5139cc386a8d2a51704048a028cf57056309d64003e57e94ff96eb13534375fe2a5bcee9deb367eae9af7353f5348099e46266399bdc0a -> cargo-c-0.10.3-funtoo-crates-bundle-212892701230e9575b0ab676845666fd1925bd3ac023f4b0ac3c15ff4e24edcebd338fba08f0be9bd3d8004d8a3f2b40edf80e245bc9755b34e87803f10f08e1.tar.gz"

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