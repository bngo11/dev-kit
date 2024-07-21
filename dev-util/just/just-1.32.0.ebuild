# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/f7c6e0cadbeef36742c6bde7df0dc8d7326be089 -> just-1.32.0-f7c6e0c.tar.gz
https://direct.funtoo.org/0d/d1/77/0dd177fc45525ccca010400a54d9a5fe6ac1160b2fb306f146b7b3b252cc74780aa60e3e04bf436a599e35dc64efa236417b5804ad338f25d672833acd561d52 -> just-1.32.0-funtoo-crates-bundle-f29cc54e9f1fef1295ce71902c8c08b17fe334c715f59f1255a6dd2c5159f42f02652161c7ee00ffbe940d7d0ffe56b69e331c187724fa3c179d47520aadf15d.tar.gz"

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