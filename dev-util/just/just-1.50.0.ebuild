# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/cbdc9f636adb26166ddcd200515e5c4b20123679 -> just-1.50.0-cbdc9f6.tar.gz
https://direct.funtoo.org/87/82/cf/8782cf03dea67f3ad6490de836259026a399a75c8eafb10a096693aa54c55fe8bc37ce4ec030258dd63ba1f3db3b1066303f5da59a588e246377aed76be24eb0 -> just-1.50.0-funtoo-crates-bundle-7cefa7f151d851eb54199d30abb8d3c6091eb0d8299bb06282f21905b7b0132c9dbbe8bd802e5ec203fb002b8f22cfbed62108ef9e1176aede44edb2072b2054.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/just"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/casey-just-* ${S} || die
}

src_install() {
	cargo_src_install

	mkdir ${S}/man
	${S}/target/release/just --man > ${S}/man/just.1
	doman man/just.1

	dodoc README.md
	einstalldocs
}