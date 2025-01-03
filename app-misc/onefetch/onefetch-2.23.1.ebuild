# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Command-line Git information tool"
HOMEPAGE="https://github.com/o2sh/onefetch"
SRC_URI="https://github.com/o2sh/onefetch/tarball/9d5131feb8874fa7d2bdea71b31b4875510b0824 -> onefetch-2.23.1-9d5131f.tar.gz
https://direct.funtoo.org/52/a8/1d/52a81dab477c83037550938e6405dab8a6459f5a376d68f7a06c869f0dd0d8657ca2d5a7d68bb3bed80d9b28ec4d7fd70fc7a2c88a98ba9222f8f59c575f0364 -> onefetch-2.23.1-funtoo-crates-bundle-f859acdcd1e966ec5f83303f70818d499c8ce68073e3b10efc5b893569dd4f92896152788947afc3e6ae7467e23d1c81015353112119588cf69f3ada80d9e0ce.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/onefetch"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/o2sh-onefetch-* ${S} || die
}