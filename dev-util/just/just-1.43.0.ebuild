# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/6e6a4412460a563723eb4abb0e4d59b19f1629d2 -> just-1.43.0-6e6a441.tar.gz
https://direct.funtoo.org/e7/13/75/e7137534b22e70601674f473c8895bfdd013c1d47f7ea6dee1d2db635718413e6cc97a4c0053c4c842b096c23b5f696dcd14d9532bfea058a3725cf8771519d3 -> just-1.43.0-funtoo-crates-bundle-2e3c3271e1c9c3fb7a299cdaf16ef53296bd716846c6b6fe303a97e7c1f5eb02bf2cd48afb70d10f2cbf9a7c828866d00f59598c8c5ebc87b7884c10f866f341.tar.gz"

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