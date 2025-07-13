# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Wayland C++ bindings"
HOMEPAGE="https://github.com/NilsBrause/waylandpp"

LICENSE="MIT"
IUSE="doc"
SLOT="0/$(ver_cut 1-2)"

SRC_URI="https://github.com/NilsBrause/waylandpp/tarball/4f208c416f37ea093e4a70a1407abd7d93c889f9 -> waylandpp-1.0.1-4f208c4.tar.gz"
KEYWORDS="*"

RDEPEND="
	>=dev-libs/wayland-1.11.0
	media-libs/mesa[wayland]
	>=dev-libs/pugixml-1.9-r1
"
DEPEND="${RDEPEND}
	doc? (
		app-doc/doxygen
		media-gfx/graphviz
	)
	"

src_configure() {
	local mycmakeargs=(
		-DBUILD_DOCUMENTATION=$(usex doc)
	)

	cmake_src_configure
}