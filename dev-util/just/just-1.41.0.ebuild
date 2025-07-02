# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/1029ae4a114043f01bd1ce9c90bdc42611fe771c -> just-1.41.0-1029ae4.tar.gz
https://direct.funtoo.org/7a/63/b0/7a63b0a8ed8bd7aed5653dc20e6d1e3673450d5c3cbc500165947416ecd70dd557917ed1fb7653633cad500f55b7c67ded11df6702454533f0a6bb183b6ac976 -> just-1.41.0-funtoo-crates-bundle-1aefe03bb10beeb10667dc6fdad6676c2f964b3a6873e5173a38cf1c26e2c907fa3ac665dc78100e2e943fdc183fdcaedc91c708893a30a59fb83f885ef4e8f2.tar.gz"

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