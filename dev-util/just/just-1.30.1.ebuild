# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/b90aa7ffe22d31cd78288c51da28ba15c9d4074f -> just-1.30.1-b90aa7f.tar.gz
https://direct.funtoo.org/7b/e1/75/7be175065415948679f6eb7f96b165a00fc32b5a6e355069aa6606574c201d0e69af826cfd6b15e42f106165ada0770a5802790bc7cd069f83ce99dd1c4786a5 -> just-1.30.1-funtoo-crates-bundle-707abd8b731ffea7d34066c947a6cca5b518e0c9efacc544446b0d6afbd113167a9f61412a556b724f0e087d5aab566aa9b66f533d383438dc7d57be209affc7.tar.gz"

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