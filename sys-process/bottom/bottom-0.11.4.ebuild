# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/0e98e0239205f641df29d5fe0b1f439e9bd9c66c -> bottom-0.11.4-0e98e02.tar.gz
https://direct.funtoo.org/ff/db/db/ffdbdbc64ebc1fc88116c5ee4ba8bf8b8879c7d8ef0cd3b8271098a5d1f4428acf64e196dcf02e188f9d9e43dd575a27150b78982f4bbb196fccf033083f5989 -> bottom-0.11.4-funtoo-crates-bundle-e3aa40c4b3a42360cc97aa1af4d869b9b8a8c3297ede7c484540fc1d5998176709df991b6178c3f78bd5cce41145c4ce24b137875997719f226fec9cf3a625c8.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

DOCS=( README.md CHANGELOG.md )

QA_FLAGS_IGNORED="/usr/bin/btm"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/ClementTsang-bottom-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}