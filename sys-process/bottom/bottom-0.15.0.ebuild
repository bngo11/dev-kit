# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/4b6a033f430728a882c40588cd96499ed550a3f1 -> bottom-0.15.0-4b6a033.tar.gz
https://direct.funtoo.org/c8/14/50/c81450aabcca529e743a2ad4c509fccf03f992e5d452a1baa140cbcda8a71f47aa11c616701fd22ca5f35fadb1eaf4353dfbd568b1cefd8ed6d847327b8d61d2 -> bottom-0.15.0-funtoo-crates-bundle-ef2f3159632148096fd9d944d212a7a730c6fee05aadcd02360305b424eb2282c731492d6133a5b72801359d894a1f5cafba58ac824bcb441bd87b2debc80f1d.tar.gz"

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