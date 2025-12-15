# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/25ffe1687d34fdbd52ee51da4d5ae1b249efa4b6 -> just-1.45.0-25ffe16.tar.gz
https://direct.funtoo.org/95/2d/bd/952dbda857f5c81598b68384baf5de145ba5c900dffa2cf007775aeabd048bd53eef84130130e1420f44a7896a116bc2c4be05a130cb201874e869717858f117 -> just-1.45.0-funtoo-crates-bundle-3669a7f64693aa63770d3c7f3269d699c860fce14774ebc7a00f0fa412ee751f3593d34c11e9c72aee2e0eeaad89c3533a992d9fa9918cb4f6d198f9709e8250.tar.gz"

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