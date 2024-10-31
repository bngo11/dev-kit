# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://direct.funtoo.org/bb/e5/97/bbe597f8f50544a93b7381ac7f6aa39e61c759c91460bee970848db9082866eb8e0526b24044289ee1276f43e6a2e01f8d5479b8e30157f16c5a47229e0d742f -> cargo-c-0.10.5-funtoo-crates-bundle-15a0f9e20d2e60e9e39b5306fef0394925f2cedddb78d3f503f34e6c83edcf5f05b59951b4209bf0572b1244cf00469731d33fd60639f153834466613f976b91.tar.gz"

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