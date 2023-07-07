# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

EGO_SUM=(
)

go-module_set_globals

DESCRIPTION="A cross-platform command-line tool to convert images into ascii art and print them on the console."
HOMEPAGE="https://github.com/TheZoraiz/ascii-image-converter"
SRC_URI="https://github.com/TheZoraiz/ascii-image-converter/tarball/d05a757c5e02ab23e97b6f6fca4e1fbeb10ab559 -> ascii-image-converter-1.13.1-d05a757.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
BDEPEND=">=dev-lang/go-1.17"

post_src_unpack() {
	mv ${WORKDIR}/TheZoraiz-ascii-image-converter-* ${S} || die
}

src_compile() {
	go build || die "compile failed"
}

src_install() {
	dobin ${PN}
	dodoc README.md
}