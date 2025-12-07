# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/439e5bdb3969b08e0dee19d99e00b12d04fab661 -> just-1.44.0-439e5bd.tar.gz
https://direct.funtoo.org/49/9c/85/499c858969cba8078afe0cf510a9e85c3db49e25bba131366e186bca9bc41c530e466a5243b7cdde9386991176c993e5394efb4a39c3a5f0de4f0c7c0e655a0b -> just-1.44.0-funtoo-crates-bundle-3669a7f64693aa63770d3c7f3269d699c860fce14774ebc7a00f0fa412ee751f3593d34c11e9c72aee2e0eeaad89c3533a992d9fa9918cb4f6d198f9709e8250.tar.gz"

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