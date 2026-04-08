# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Cross-platform Rust rewrite of the GNU coreutils"
HOMEPAGE="https://github.com/uutils/coreutils https://uutils.github.io/coreutils/docs/"
SRC_URI="https://github.com/uutils/coreutils/tarball/4f67c002d291c506aecd23f704da1c2b9aa2fc37 -> coreutils-0.8.0-4f67c00.tar.gz
https://direct.funtoo.org/3e/2c/7d/3e2c7dad829167589e25165d5fb11fb662714279c988495c1507b7d79d69cd79d6cfc56be300152d0894c5d5c60f8e99889d74e38b6c291332fd00d0bd97361b -> uutils-coreutils-0.8.0-funtoo-crates-bundle-adccf6090119f5b627dfaa9dccdd63cec5139561a31837a6af09d7287af2ccc8f63b2643bb81486be57688aa4ddf17d5a884c90fae72398b7bf9b252e2304eac.tar.gz"

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