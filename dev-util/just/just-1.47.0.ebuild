# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/6b0829c094421a932277b7bff91917f73ddbcbdb -> just-1.47.0-6b0829c.tar.gz
https://direct.funtoo.org/a9/af/81/a9af81dc2368c27b8b9f1b466fdceac22bd761afea27e857bb8f41bf5a7bdc2b68fedcbc4904d368a4065f327fa79777b3f0ac055c23b50e46f60100b083dac1 -> just-1.47.0-funtoo-crates-bundle-4c73538472a69cc4f50909eaa0efeb74b42207a0cf2d8fe79681e9f76e6579b1ba15ab46e0fa240ca50d9ed625f96b7e4354e469ec76b7fef7a9ccff39e76e06.tar.gz"

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