# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/ebedee5bafe1ce779e93d91a2eff0c1bf3687b9c -> just-1.58.0-ebedee5.tar.gz
https://direct.funtoo.org/56/d3/3a/56d33a21cfc8e1e07164b5e3f1af41057e42e45818891b4ecaff17ed2de7d0fe5e5063d79da1d3953a45ffc0d5fca9cced6aa770081cb207eb8b46232fe452fb -> just-1.58.0-funtoo-crates-bundle-7f95aac08683d042729af30f086f43c73b7c6871ad97632529941e2874ff67f9e286818c0e17abb95c9201e4cd1eb100fb466cc2d95522eb1851c8ea0c80175d.tar.gz"

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