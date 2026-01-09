# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools toolchain-funcs

DESCRIPTION="A collection of multi-dimensional data structure and indexing algorithm"
HOMEPAGE="https://gitlab.com/mdds/mdds"
SRC_URI="https://github.com/kohei-us/mdds/tarball/b5a52dfb293548e8580be8754be055d9e1e54f28 -> mdds-3.2.0-b5a52df.tar.gz"
KEYWORDS="*"
LICENSE="MIT"
SLOT="${PV%.*}/${PV}"
IUSE="doc valgrind"

BDEPEND="
	doc? (
		app-doc/doxygen
		dev-python/sphinx
	)
	valgrind? ( dev-util/valgrind )
"
DEPEND="dev-libs/boost:="
RDEPEND="${DEPEND}"

post_src_unpack() {
	mv "${WORKDIR}"/kohei-us-mdds-* "${S}" || die
}

src_prepare(){
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable doc docs) \
		$(use_enable valgrind memory_tests)
}

src_compile() { :; }

src_test() {
	tc-export CXX
	default
}