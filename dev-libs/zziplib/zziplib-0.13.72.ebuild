# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
# Needed for docs; see Gentoo bug #835755
PYTHON_REQ_USE="xml(+)"
inherit cmake flag-o-matic python-any-r1

DESCRIPTION="Lightweight library for extracting data from files archived in a single zip file"
HOMEPAGE="https://github.com/gdraheim/zziplib https://zziplib.sourceforge.net"
SRC_URI="https://github.com/gdraheim/zziplib/tarball/7f8e01b5fa7f076bbe4f026d6a30160272da69fe -> zziplib-0.13.72-7f8e01b.tar.gz"

LICENSE="|| ( LGPL-2.1 MPL-1.1 )"
SLOT="0/13"
KEYWORDS="*"
IUSE="sdl static-libs"

# Tests require internet access
# https://github.com/gdraheim/zziplib/issues/24

BDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	sys-libs/zlib
	sdl? ( >=media-libs/libsdl-1.2.6 )
"
RDEPEND="${DEPEND}"
PATCHES=(
	"${FILESDIR}"/"${PN}-0.13.72-incompatible-pointer-types.patch"
	"${FILESDIR}"/"${PN}-0.13.72-Wint-conversion.patch"
)

S="${WORKDIR}/gdraheim-zziplib-7f8e01b"


src_configure() {
	# https://github.com/gdraheim/zziplib/commit/f3bfc0dd6663b7df272cc0cf17f48838ad724a2f#diff-b7b1e314614cf326c6e2b6eba1540682R100
	append-flags -fno-strict-aliasing
	# https://github.com/gdraheim/zziplib/issues/140 (bug #869980)
	append-flags $(test-flags-CC -Wno-error=incompatible-function-pointer-types -Wno-error=int-conversion)

	local mycmakeargs=(
		-DZZIPSDL="$(usex sdl)"
		-DBUILD_STATIC_LIBS="$(usex static-libs)"
		-DBUILD_TESTS=OFF
		-DZZIPTEST=OFF
		-DZZIPDOCS=ON
		-DZZIPWRAP=OFF
	)

	cmake_src_configure
}

# vim: noet ts=4 syn=ebuild