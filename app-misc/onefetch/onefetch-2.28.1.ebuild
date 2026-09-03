# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Command-line Git information tool"
HOMEPAGE="https://github.com/o2sh/onefetch"
SRC_URI="https://github.com/o2sh/onefetch/tarball/9beb80329cf2e5bd784270f668139f0bafb48e2b -> onefetch-2.28.1-9beb803.tar.gz
https://direct.funtoo.org/a7/6b/00/a76b00dc80e8e953d1340a8c9c2f75c3ee8f5027df3f2758975b954c3375e5ccc25cdcf7d145d8c06d4848f22b61189021c7acef37432ac8fd7bdbb66a59952c -> onefetch-2.28.1-funtoo-crates-bundle-8267df6b1b8ff525c0b1d4c4ea302f409b35789326cf0b3189d645a6f137f99f9e93f75726dbbc28c2e37b81705eb0ac2919ce8cdba7a25dd849a186e10d68b3.tar.gz"

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