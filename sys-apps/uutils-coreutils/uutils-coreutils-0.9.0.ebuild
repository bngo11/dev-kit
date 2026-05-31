# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Cross-platform Rust rewrite of the GNU coreutils"
HOMEPAGE="https://github.com/uutils/coreutils https://uutils.github.io/coreutils/docs/"
SRC_URI="https://github.com/uutils/coreutils/tarball/9eefc3705093910ad8e8bbcf7e5f84a49720340f -> coreutils-0.9.0-9eefc37.tar.gz
https://direct.funtoo.org/a0/07/62/a007621ff7fab44de6d2970b87f31241ce61beb565a227983717758ac880b3e45e81cf4a21f4a673abbf685ad5c82b3088ca1ae78c7d50da49d4d72916599c76 -> uutils-coreutils-0.9.0-funtoo-crates-bundle-54cd6084e979792ef80f362780ed24f7814a24bbe342b590e0ad1ea79ffba63d9889623a43596ce73fc1a5285a66c141d50a1ea0da9685cf349e4eba159e7757.tar.gz"

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