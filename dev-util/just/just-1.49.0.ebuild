# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/14aa0f057b6ce5fd2932503b25eee946ce337e52 -> just-1.49.0-14aa0f0.tar.gz
https://direct.funtoo.org/f4/9e/e8/f49ee80c403cc7092529f710732ded2956eb4ac881336254dbedc41d5afbb5f905ecb2c1bfa9db8b0022e618f5940924afa86f8382324002509c2432bc8fa4b4 -> just-1.49.0-funtoo-crates-bundle-f57624737b4f026ca2e55b298448285d6ae0f0ab89ebe58751389c9068986b97f098fc6ee0b895a8959a15839eed246b50f4384405689d747a9ba96af9bb411c.tar.gz"

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