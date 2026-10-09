# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Command-line Git information tool"
HOMEPAGE="https://github.com/o2sh/onefetch"
SRC_URI="https://github.com/o2sh/onefetch/tarball/e4763a3bd07ac074b08a7a8512299627ccf0c6cd -> onefetch-3.0.0-e4763a3.tar.gz
https://direct.funtoo.org/02/31/cd/0231cd4b12ed1d1c27757209c91251404de4597b63a0ef55c985b592ab63a00dd7dc12bb7783ab8b802538c2ca882e1336412dd5aef61a647092d6c47b84a52e -> onefetch-3.0.0-funtoo-crates-bundle-e37b812256fafd6ab8dcfa3444f7f299be7e245e631521f71b1eea0bf79b349ec4340be0a739280147ea27d31f615384730ed03472d56b2f0a84baa3dd4b27c4.tar.gz"

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