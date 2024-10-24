# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="C++ fast hash map and hash set using robin hood hashing"
HOMEPAGE="https://github.com/Tessil/robin-map"
SRC_URI="https://api.github.com/repos/Tessil/robin-map/tarball/v0.6.3 -> robin-map-0.6.3.tar.gz"

KEYWORDS="*"
LICENSE="MIT"
SLOT="0"

src_unpack() {
	default
	rm -rf "${S}"
	mv "${WORKDIR}"/Tessil-robin-map-* "${S}" || die
}