# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/ef4eaf420fae7767758b16324e888d5791fd3c3a -> just-1.42.2-ef4eaf4.tar.gz
https://direct.funtoo.org/3a/99/51/3a995135bda5fbfeb89e2566a2145d8abdec8fc56acd349c247d1bf9bd652f07335da8d194c6bc8ea607124074a0e145e52a0dc991ebdeae3c036dfc222954ca -> just-1.42.2-funtoo-crates-bundle-6b101506e551a4afb1b2b285231fe514bfd808bc59c79eae034b8c8335ade669e58dc8f52576ac73141bc7df3a6b41b036261211a3c51c4a1043e2ec5278a9ce.tar.gz"

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