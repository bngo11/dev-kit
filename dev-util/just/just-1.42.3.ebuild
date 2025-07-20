# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/07bab1dbbe4c4c352a62419f2042c82d6867c13b -> just-1.42.3-07bab1d.tar.gz
https://direct.funtoo.org/34/f7/19/34f719c592aff27a0ce67c7bca07ad0cc5ec75a34af8dc8f30762dd14e7c60943a823e3ab627594dcca2a48078e16e912e0ccd7172bf70d98ce4400789af7e27 -> just-1.42.3-funtoo-crates-bundle-207feb656eed76656339694375b5a47177eac5c7a5568264207f59f890cc2375b5f16a818b1387670357367e23caab08fbbe079b4eee4774aabb726031c9c762.tar.gz"

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