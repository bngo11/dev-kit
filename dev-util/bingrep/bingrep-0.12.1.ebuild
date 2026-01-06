# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="like ~~grep~~ UBER, but for binaries"
HOMEPAGE="https://github.com/m4b/bingrep"
SRC_URI="https://github.com/m4b/bingrep/tarball/019d6ed8c2549b30bba2c50763f217d816ccd390 -> bingrep-0.12.1-019d6ed.tar.gz
https://direct.funtoo.org/91/97/f1/9197f17b2a974dd56046ba383315c6951536a105512a0f1e230be593a2aedc67ebc91f17f55018c6f003bf8ee978b730d3f622817b3f7d91b067387f837465e0 -> bingrep-0.12.1-funtoo-crates-bundle-e05cad7f4f057dc15f6931a92acd505fc87cc771549d208469a9530451b16748ccf5638bfe743017d85b57845afddf86d8fc3ecc83c331b6b1748362f5f6dce2.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

QA_FLAGS_IGNORED="/usr/bin/bingrep"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/m4b-bingrep-* ${S} || die
}