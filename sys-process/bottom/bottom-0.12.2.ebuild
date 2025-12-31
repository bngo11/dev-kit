# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/9ef7b687b36373202f8d1f65e25b8494840252f6 -> bottom-0.12.2-9ef7b68.tar.gz
https://direct.funtoo.org/c0/6e/3a/c06e3ad0a9097655cf1412c977b66dc9334a513d986d390124af1827bf2cf49df4b57d176cf3980eb066ae6d7d7af1accb0fd68e75ba11c0c5f046bb23b0dc28 -> bottom-0.12.2-funtoo-crates-bundle-9e3ff140c09390376b17665808e533233f02687fbe92580fcdf7b6b012f4260f68a66cc486737b442fa36553f07ff13f941bcdcf70035314b91784bf60d67e20.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

DOCS=( README.md CHANGELOG.md )

QA_FLAGS_IGNORED="/usr/bin/btm"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/ClementTsang-bottom-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}