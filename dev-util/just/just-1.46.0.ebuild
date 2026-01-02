# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/f39e832f09f8b34159ef7dd8401f5187ab86410b -> just-1.46.0-f39e832.tar.gz
https://direct.funtoo.org/f5/52/d9/f552d931dc0233bfe72af8a466d5d6289760c0f5621d855a01f7b01b7400f89a0e6e15e0d7c2adf298fc87b6c644f68f7b562632d92f392e521ef7a2290a81cc -> just-1.46.0-funtoo-crates-bundle-ae2b76c7adce56bb01abaaea42fa16575c0950a0bf17762680fe7215a4322e31bb072eb47ba71b1340b41d45f255d1d3eba42af23101e1329cc66579446380b8.tar.gz"

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