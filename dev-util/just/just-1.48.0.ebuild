# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/6ce9eb1730929282ef97d94f73cab0be5b77e246 -> just-1.48.0-6ce9eb1.tar.gz
https://direct.funtoo.org/85/2e/69/852e69169f998722adc084aa4a7a3c87d400113e8cf21c840e1124e19f92f82e8fc6e05ca4d15a05168745d0ce55e398cf4a672c6bf4e2b33e2b5dced1cc1367 -> just-1.48.0-funtoo-crates-bundle-8a322ca39d167ea6f29eb2ba0f532b3bbe9f0d88ca6b0f57f22fc083cbb4488d0b3ef0760d112143de8ffd1b9af15a2bdc4979fa931742d6da0b7535913647c1.tar.gz"

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