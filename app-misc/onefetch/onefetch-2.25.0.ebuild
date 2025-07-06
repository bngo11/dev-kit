# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Command-line Git information tool"
HOMEPAGE="https://github.com/o2sh/onefetch"
SRC_URI="https://github.com/o2sh/onefetch/tarball/57768208149c640144020a7d5108fc32b272934a -> onefetch-2.25.0-5776820.tar.gz
https://direct.funtoo.org/ef/30/c3/ef30c3c21dc78416c13cd42c00781ff2c094be97888fb289f2fb90757d45887ef475db2c970b4f377c28712e326f929978a519aa7e8fefa9995a4a12c2d9ee58 -> onefetch-2.25.0-funtoo-crates-bundle-cc95cff763bfc26bdb160fb0cab23d40a0670d55f81b1d73aa5070d238989f032a958be61fe695d3946a623235c7ad0b3d00a1c1d2f510739b145bbd4b2138d9.tar.gz"

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