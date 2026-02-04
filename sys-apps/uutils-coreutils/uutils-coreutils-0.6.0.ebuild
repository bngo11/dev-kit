# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Cross-platform Rust rewrite of the GNU coreutils"
HOMEPAGE="https://github.com/uutils/coreutils https://uutils.github.io/coreutils/docs/"
SRC_URI="https://github.com/uutils/coreutils/tarball/d3c10b499a08aab2c435c67d8077dabc6c856750 -> coreutils-0.6.0-d3c10b4.tar.gz
https://direct.funtoo.org/e9/54/e7/e954e7e9fe17a1b51105b1d05ea84a6d96b20c4bd1a62ffa47783d6ec4e4313e78f44d33d0dfaf5b85afd9613cc822d5b6f11c4938da2ed23f7ecfa62266004f -> uutils-coreutils-0.6.0-funtoo-crates-bundle-b08e0c1354b15cdd1602db2e589d07a5dfca8daa6ec6bd8599f1877d466352a0758f5e21c1510d0067f1fc146cfe27c0bed3c886a21a0e626b6de109f51f9ea1.tar.gz"

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