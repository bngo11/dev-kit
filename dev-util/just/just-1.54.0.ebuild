# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/6c134089465461e466bbb72843096b4215d786c9 -> just-1.54.0-6c13408.tar.gz
https://direct.funtoo.org/3a/83/fc/3a83fc342ea00731819b7f6c113b484e08656fa916b0a029c2f3472ae30539ff68b1f1e22989ae1c7185b90c6b09f005a0797e4783b1388628b24e312230611f -> just-1.54.0-funtoo-crates-bundle-e42e88db23f6b829fe47c6e164f37db57833f65f3e7d2ed78ea3d35ab99f61db4ab2124eee9f6c97f7afdec870c7f4596813a7739b1fd1f792a1fc94bd0ddec2.tar.gz"

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