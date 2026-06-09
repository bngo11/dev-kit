# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/f41d35750fcd786c711d08bc0182a2909499e74e -> just-1.52.0-f41d357.tar.gz
https://direct.funtoo.org/20/c0/d9/20c0d933096e45a475bd4c09def737919c95228efc450c9373daf68ad8c47720563457aaba9d97404bbe323666faafb4bbc3c10dd50d1bca2c471b79e0e62fd9 -> just-1.52.0-funtoo-crates-bundle-cad8b4c41a29bf08a2e1cd0c27f4e1664d3bf0428afa06f243b3259b8bb758ca39cd078381d72f86957145b5f949e52c4f94ba8ef2a2d7007a61a7627ccae232.tar.gz"

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