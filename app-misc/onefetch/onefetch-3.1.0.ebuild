# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Command-line Git information tool"
HOMEPAGE="https://github.com/o2sh/onefetch"
SRC_URI="https://github.com/o2sh/onefetch/tarball/a84d62403c5e530eead293804afd43c527d9d433 -> onefetch-3.1.0-a84d624.tar.gz
https://direct.funtoo.org/c0/fa/92/c0fa92260e7d496634863acfd20c24a4d47129ae5e840b2d4d286c35d05af5724125570b18f9745323e623ac46dd6a3df03066132fcb26705f3b1c42445616ac -> onefetch-3.1.0-funtoo-crates-bundle-886a32612088d766f9b8c45068cc9af59c9b4903564e49a1f7646e904f3fb8cd91a24bd10df3024804ed2e00e2f7e970ed903fa4f8104a7f2ff1ea0749cb563c.tar.gz"

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