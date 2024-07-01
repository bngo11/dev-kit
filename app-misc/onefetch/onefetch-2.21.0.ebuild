# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Command-line Git information tool"
HOMEPAGE="https://github.com/o2sh/onefetch"
SRC_URI="https://github.com/o2sh/onefetch/tarball/ed99fe2c89bfba52a12dcbf4d03264d2ae9c714d -> onefetch-2.21.0-ed99fe2.tar.gz
https://direct.funtoo.org/0f/8c/e4/0f8ce4c273baed8fbb0e1ec08655b2f9c3d0b87baf5d0262da366511caeea8a8f77b3e0e8ca40862e5b3c1dabde7f67d899ef70a5e2225ccc3247ac3467951a5 -> onefetch-2.21.0-funtoo-crates-bundle-e54121f91a6feda32b6c930a179a67aab241a96b6297e4d50b851bca048ae42ec16ea25c0027ed3c860654fce930259d7d3e3915defc1c0ff84001a01e7fbc1b.tar.gz"

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