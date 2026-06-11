# Distributed under the terms of the GNU General Public License v2

EAPI=7
VALA_USE_DEPEND="vapigen"

inherit cmake vala

DESCRIPTION="Ayatana Application Indicators (Shared Library)"
HOMEPAGE="https://github.com/AyatanaIndicators/libayatana-appindicator"
SRC_URI="https://github.com/AyatanaIndicators/libayatana-appindicator/tarball/27f9d9ddcf20be87c6cede65c89c5b098b16330d -> libayatana-appindicator-0.6.0-27f9d9d.tar.gz"

LICENSE="GPL-3 LGPL-2 LGPL-3"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	dev-libs/glib:2
x11-libs/gtk+:3[introspection]
	dev-libs/libdbusmenu[gtk3]
dev-libs/libayatana-indicator"
DEPEND="${RDEPEND}"
BDEPEND="
	$(vala_depend)
"
S="${WORKDIR}/AyatanaIndicators-libayatana-appindicator-27f9d9d"

src_prepare() {
	default

	cmake_src_prepare
	vala_src_prepare
}

src_configure() {
	local mycmakeargs+=(
		-DVALA_COMPILER="${VALAC}"
		-DVAPI_GEN="${VAPIGEN}"
		-DENABLE_TESTS=OFF
		-DENABLE_BINDINGS_MONO=OFF
		-DENABLE_GTKDOC=OFF
		-DFLAVOUR_GTK2=OFF
		-DFLAVOUR_GTK3=ON
	)

	cmake_src_configure
}
