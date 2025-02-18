# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3+ )

inherit flag-o-matic meson python-any-r1 vala

SRC_URI="https://github.com/martinpitt/umockdev/releases/download/${PV}/${P}.tar.xz"
KEYWORDS="*"

DESCRIPTION="Mock hardware devices for creating unit tests"
HOMEPAGE="https://github.com/martinpitt/umockdev/"

LICENSE="LGPL-2.1+"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	net-libs/libpcap
	virtual/libudev:=
	>=dev-libs/glib-2.32:2
	>=dev-libs/gobject-introspection-1.32:=
"
DEPEND="${RDEPEND}
	test? (
		${PYTHON_DEPS}
		dev-libs/libgudev:=
	)
"
BDEPEND="
	$(vala_depend)
	app-arch/xz-utils
	virtual/pkgconfig
"

pkg_setup() {
	use test && python-any-r1_pkg_setup
}

src_prepare() {
	default
	vala_src_prepare
}

src_configure() {
	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101270
	filter-flags -fno-semantic-interposition

	export VALAC="$(type -P valac-$(vala_best_api_version))"
	meson_src_configure
}

src_test() {
	meson_src_test --no-suite fails-valgrind
}
