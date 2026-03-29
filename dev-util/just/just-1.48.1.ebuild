# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/cd458a2ff047207dbbd6153c306a17a14235ff50 -> just-1.48.1-cd458a2.tar.gz
https://direct.funtoo.org/d1/68/28/d16828c2aedae1634b0e30c0b559c825a70ae38d1b4ddc4112bfa8af147a4666cc5cf905ec57866cdb4a7599d43db7984be77385e0b9c9fcb1b2dc63f647c1fa -> just-1.48.1-funtoo-crates-bundle-0c9dbc82c2926d02b2c3d566e6f8e20061c465bf0689481a3550e238a8adbebabf321fb37fce4866d3dcb5c5e35943cfdc3f8f76a1cd231bb2525e95a2d5d1f7.tar.gz"

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