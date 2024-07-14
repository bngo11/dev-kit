# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/3a2b7cfc1e9eb4fb9054d23dd816b59d10a2f49e -> cargo-c-0.10.2-3a2b7cf.tar.gz
https://direct.funtoo.org/44/15/b4/4415b44bbe4a17f9bc34aa219fca32a4180afe8fe35aef8730e73cde170c6341f1fdd13c7fb9eb1d7983c0eabaf915637718360451dacd536ec0471efb3a33d1 -> cargo-c-0.10.2-funtoo-crates-bundle-a44ea0bfaae25454fad7cbb78bc689d29f3a4c2d3e0ff39dda12145ee85b9e75aff5d703a8ff474d8a95bb871f14feeb1bb2d9b3303afd03f2ee1b199e82ddc8.tar.gz"

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