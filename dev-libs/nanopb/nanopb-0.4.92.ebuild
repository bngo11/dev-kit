# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake flag-o-matic

DESCRIPTION="plain-C Protocol Buffers for embedded/memory-constrained systems"
HOMEPAGE="https://jpa.kapsi.fi/nanopb/ https://github.com/nanopb/nanopb"
SRC_URI="https://github.com/nanopb/nanopb/tarball/160d4f09e5fabb2b66aa2dea32d4f38ace2c4b3f -> nanopb-0.4.92-160d4f0.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="*"
IUSE="doc examples +pb-malloc"

RDEPEND="
	dev-libs/protobuf
"
DEPEND="
	dev-util/scons
	${RDEPEND}
"

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}"/nanopb-nanopb-* "${S}"
}

src_configure() {
	use pb-malloc && append-cppflags "-DPB_ENABLE_MALLOC"
	cmake_src_configure
}