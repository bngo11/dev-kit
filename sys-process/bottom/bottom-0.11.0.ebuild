# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/566502347eeb61819a33a2222faf3621583430a9 -> bottom-0.11.0-5665023.tar.gz
https://direct.funtoo.org/ad/1c/4f/ad1c4f041da4fe1324ec136baf85fe82e1a6dbbeb46ac9bab0a0f4af0cb8bc12f7c0a68f55e2a4a9522d71fb8f8965a65b25e1d3179bba3c5a63bfe905ff441b -> bottom-0.11.0-funtoo-crates-bundle-4ef85ce12f36296a639238e896233240cbb1a572265f1b16cafebd0034f96bf24508efea4eb0da115be40a93e4f3a0e9ff30a354534e039a445b9be530202753.tar.gz"

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