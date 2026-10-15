# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/86955cf7350674082802c8e886f36769537e0d22 -> just-1.59.0-86955cf.tar.gz
https://direct.funtoo.org/06/88/d8/0688d8ca989a5dbfc0988d6af4848969e319396e0fef31eaf8a31cd64e72827f28d0fac2a3457923e8801de33f4b5c7b5357b36332ca5e7916cd7c23977af8d2 -> just-1.59.0-funtoo-crates-bundle-28bd09f774cc55d6c6f85bd4978bc8ae63ba87aad12f9e0a749feea68e71ed36edac20a34eeac5c447b8ec64664fcc35da3d394b6cd983b0d937b0b38046ab7c.tar.gz"

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