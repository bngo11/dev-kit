# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )

inherit meson python-single-r1 virtualx

DESCRIPTION="Compiler for Blueprint, a markup language for GTK user interfaces"
HOMEPAGE="https://jwestman.pages.gitlab.gnome.org/blueprint-compiler/
	https://gitlab.gnome.org/jwestman/blueprint-compiler/"

SRC_URI="https://gitlab.gnome.org/jwestman/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.bz2"
S="${WORKDIR}"/${PN}-v${PV}
KEYWORDS="*"

LICENSE="LGPL-3+"
SLOT="0"
IUSE="doc test"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RESTRICT="!test? ( test )"

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/pygobject:3[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	${RDEPEND}
	doc? (
		$(python_gen_cond_dep '
			dev-python/furo[${PYTHON_USEDEP}]
			dev-python/sphinx[${PYTHON_USEDEP}]
		')
	)
	test? (
		gui-libs/gtk:4[introspection]
		gui-libs/libadwaita:1[introspection]
	)
"

DOCS=( CONTRIBUTING.md MAINTENANCE.md NEWS.md README.md )

src_configure() {
	local -a emesonargs=(
		$(meson_use doc docs)
	)
	meson_src_configure
}

src_compile() {
	meson_src_compile

	use doc && build_sphinx docs
}

src_test() {
	virtx meson_src_test
}

src_install() {
	meson_src_install
	python_fix_shebang "${ED}"/usr/bin
	python_optimize
}