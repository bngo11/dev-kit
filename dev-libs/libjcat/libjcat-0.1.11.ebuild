# Distributed under the terms of the GNU General Public License v2

EAPI=7
VALA_USE_DEPEND="vapigen"

inherit meson vala

DESCRIPTION="Library for reading and writing Jcat files"
HOMEPAGE="https://github.com/hughsie/libjcat"
SRC_URI="https://github.com/hughsie/libjcat/archive/0.1.11.tar.gz -> libjcat-0.1.11.tar.gz"
LICENSE="LGPL-2.1+"
SLOT="0"

KEYWORDS="*"
IUSE="doc introspection test"

RDEPEND="
	dev-libs/glib:2
	sys-apps/util-linux
"

DEPEND="
	$(vala_depend)
	${RDEPEND}
	doc? ( dev-util/gtk-doc )
	introspection? ( dev-libs/gobject-introspection )
"

BDEPEND="
	>=dev-util/meson-0.47.0
	virtual/pkgconfig
"

src_prepare() {
	default
	vala_src_prepare
}

src_configure() {
	local emesonargs=(
		-Dgtkdoc="$(usex doc true false)"
		-Dintrospection="$(usex introspection true false)"
		-Dtests="$(usex test true false)"
	)

	meson_src_configure
}