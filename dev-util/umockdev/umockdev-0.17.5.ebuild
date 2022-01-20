# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3+ )

inherit multilib-minimal python-any-r1 meson vala

DESCRIPTION="Mock hardware devices for creating unit tests"
HOMEPAGE="https://github.com/martinpitt/umockdev/"
SRC_URI="https://github.com/martinpitt/umockdev/releases/download/0.17.5/umockdev-0.17.5.tar.xz -> umockdev-0.17.5.tar.xz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	virtual/libudev:=[${MULTILIB_USEDEP}]
	>=dev-libs/glib-2.32:2[${MULTILIB_USEDEP}]
	>=dev-libs/gobject-introspection-1.32:=
"
DEPEND="${RDEPEND}
	test? (
		${PYTHON_DEPS}
	)
	app-arch/xz-utils
	dev-libs/libgudev[${MULTILIB_USEDEP}]
	>=dev-util/gtk-doc-am-1.14
	virtual/pkgconfig
"

# Tests seem to hang forever
# RESTRICT="test"

src_prepare() {
	default
	vala_src_prepare
}

pkg_setup() {
	use test && python-any-r1_pkg_setup
}

multilib_src_configure() {
	local mesonargs=(
		--Dgtk_doc=False
	)

	meson_src_configure
}

multilib_src_install_all() {
	einstalldocs
	find "${D}" -name '*.la' -delete || die
}