# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Cross-platform Rust rewrite of the GNU coreutils"
HOMEPAGE="https://github.com/uutils/coreutils https://uutils.github.io/coreutils/docs/"
SRC_URI="https://github.com/uutils/coreutils/tarball/68c77b4bd129bdc12d03cc74fe0f817d2df75894 -> coreutils-0.0.25-68c77b4.tar.gz
https://direct.funtoo.org/d4/2b/15/d42b15f6d6991a6e7fc2499652aee77677897cc1108421ad2c992308c8163188c6bd19ec81c231ed99973f08db6e8f91d3f545ac0f452aec4092e5e456d20964 -> uutils-coreutils-0.0.25-funtoo-crates-bundle-9196d6c0861cf42343c48ee45cfbf075d051a9888c7f739e9e93102e8a3a59254d722d2b9b7259a71275c532e78dc4316af265835cfb56f911327cb08ff9cc55.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

DOCS=( README.md )

QA_FLAGS_IGNORED="/usr/bin/coreutils"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/uutils-coreutils-* ${S} || die
}

src_configure() {
	cargo_src_configure --features unix
}

src_install() {
	cargo_src_install
	einstalldocs
}