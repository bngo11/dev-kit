# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Command-line Git information tool"
HOMEPAGE="https://github.com/o2sh/onefetch"
SRC_URI="https://github.com/o2sh/onefetch/tarball/497d4c011ede6acba4b3ca4c1e62f9aecaf20528 -> onefetch-2.27.1-497d4c0.tar.gz
https://direct.funtoo.org/1c/74/d9/1c74d9b35bbca1034514bc53efe4c6f830382de7904e7a8876b02e13dd9b3b0ab93524d69e9d9156c308ab6f97e064aa351572f8cc18a8d55dae572e300ea1d0 -> onefetch-2.27.1-funtoo-crates-bundle-909cdf4210402d8e0c3c64cdbf60a72f191f83f264429799d6e0bc59d512da78316b13ae19121265a06d53d08971b35a0124cf5514e2139ba4a5d29631eaecec.tar.gz"

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