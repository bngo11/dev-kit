# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/f9963a4df9bd438e0db91f9440b7c58ef0432c85 -> just-1.56.0-f9963a4.tar.gz
https://direct.funtoo.org/3a/e7/b9/3ae7b9a2a9d7cb7cd2600c0d7768900f88f28b931bc52497f5afc12354c74d97431a8b75daaf46803a56b621635337515860e00734c06351ac201f44e555a42a -> just-1.56.0-funtoo-crates-bundle-9f6784cfa7662ffbf4f3c0aeb459daf7abe46d6147fe1b1f8596aed02287822e24a658b20d54f26e151cacbe670c9893f6a72f8d8ceb0a32165820f03092c312.tar.gz"

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