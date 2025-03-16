# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/aa7780e183401361c25fd48cc111769dca1812bb -> just-1.40.0-aa7780e.tar.gz
https://direct.funtoo.org/a2/1f/ad/a21fade6a0b9737f12418d147a2c6abea71f2fa2bae770b3a8a2169f99a1e6d95e5ae0d7f26676362c28567af9f44cab66f9b0faa237d02cff296508bdeb5652 -> just-1.40.0-funtoo-crates-bundle-c58962ec64efba8d5ad1110aba86ac9e70d59d2065b9e1fef7ae0b488ae6b0cd410c697b73b8ca410336881ea0ecf7994429c09d1ae887df0b17b989f9ae41b4.tar.gz"

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