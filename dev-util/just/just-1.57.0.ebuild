# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/990e83db3a6ffa049ea0e4ec1eb3589351ce85d7 -> just-1.57.0-990e83d.tar.gz
https://direct.funtoo.org/2c/0f/b9/2c0fb95e6dcfcff0b002967a5237477150700fa7deff5016617401c774fa50f571b3c050567631bebbdb188e2e2b11fafc72360e9719a9aa66a2ad832b521236 -> just-1.57.0-funtoo-crates-bundle-85cdee1a78404bcc9eec4d8ada664a60b8d59ae380749fa2775994dfcb9016e82bb25f347aa9f4db926b3747d13abdd2079d030378f8a803449d808985bab560.tar.gz"

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