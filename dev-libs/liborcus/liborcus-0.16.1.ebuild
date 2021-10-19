# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit python-single-r1

DESCRIPTION="Standalone file import filter library for spreadsheet documents"
HOMEPAGE="https://gitlab.com/orcus/orcus/blob/master/README.md"
SRC_URI="https://kohei.us/files/orcus/src/${P}.tar.xz"
KEYWORDS="*"
LICENSE="MIT"
SLOT="0/0.16" # based on SONAME of liborcus.so
IUSE="python +spreadsheet-model static-libs tools"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="
	dev-libs/boost:=[zlib(+)]
	sys-libs/zlib
	python? ( ${PYTHON_DEPS} )
	spreadsheet-model? ( dev-libs/libixion:${SLOT} )
"
DEPEND="${RDEPEND}
	dev-util/mdds:1.5
"

PATCHES=( "${FILESDIR}/${PN}-0.15.4-gcc11.patch" ) # bug 764035

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_prepare() {
	default
}

src_configure() {
	local myeconfargs=(
		--disable-werror
		$(use_enable python)
		$(use_enable spreadsheet-model)
		$(use_enable static-libs static)
		$(use_with tools)
	)
	econf "${myeconfargs[@]}"
}

src_install() {
	default
	find "${D}" -name '*.la' -type f -delete || die
}
