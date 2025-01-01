# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Command-line Git information tool"
HOMEPAGE="https://github.com/o2sh/onefetch"
SRC_URI="https://github.com/o2sh/onefetch/tarball/6f01038519ad5166131e50eff3d67238f393b0ee -> onefetch-2.23.0-6f01038.tar.gz
https://direct.funtoo.org/a2/50/c1/a250c123966d40f12eeb1f1f6b26919f48ad447b56362a6ab430ef23986f0cd1822762d92a950017798a0c55adffba7d2724f87d5f71d81e0d179ce8cdf174bb -> onefetch-2.23.0-funtoo-crates-bundle-f859acdcd1e966ec5f83303f70818d499c8ce68073e3b10efc5b893569dd4f92896152788947afc3e6ae7467e23d1c81015353112119588cf69f3ada80d9e0ce.tar.gz"

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