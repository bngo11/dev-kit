# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit python-single-r1

DESCRIPTION="General purpose formula parser & interpreter"
HOMEPAGE="https://gitlab.com/ixion/ixion"
SRC_URI="https://kohei.us/files/ixion/src/${P}.tar.xz"
KEYWORDS="*"
LICENSE="MIT"
SLOT="0/0.16" # based on SONAME of libixion.so
IUSE="debug python static-libs +threads"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="
	dev-libs/boost:=
	dev-util/mdds:1.5
	python? ( ${PYTHON_DEPS} )
"
DEPEND="${RDEPEND}"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_prepare() {
	default
	[[ ${PV} == *9999 ]] && eautoreconf
}

src_configure() {
	local myeconfargs=(
		$(use_enable debug)
		$(use_enable python)
		$(use_enable static-libs static)
		$(use_enable debug debug-utils)
		$(use_enable debug log-debug)
		$(use_enable threads)
	)
	econf "${myeconfargs[@]}"
}

src_install() {
	default
	find "${D}" -name '*.la' -type f -delete || die
}
