# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Performance-portable, length-agnostic SIMD with runtime dispatch"
HOMEPAGE="https://github.com/google/highway"

SRC_URI="https://github.com/google/highway/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="*"

LICENSE="Apache-2.0"
SLOT="0"
IUSE="test"

DEPEND="test? ( dev-cpp/gtest )"

RESTRICT="!test? ( test )"

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTING=$(usex test)
		-DHWY_WARNINGS_ARE_ERRORS=OFF
	)

	use test && mycmakeargs+=( "-DHWY_SYSTEM_GTEST=ON" )

	cmake_src_configure
}
