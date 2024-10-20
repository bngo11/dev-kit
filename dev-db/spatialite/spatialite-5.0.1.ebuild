# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit flag-o-matic

MY_PN="lib${PN}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A complete Spatial DBMS in a nutshell built upon sqlite"
HOMEPAGE="https://www.gaia-gis.it/gaia-sins/"
SRC_URI=http://www.gaia-gis.it/gaia-sins/libspatialite-sources/libspatialite-5.0.1.tar.gz

LICENSE="MPL-1.1 gcp? ( GPL-2+ )"
SLOT="0"
KEYWORDS="*"
IUSE="gcp +geos iconv +proj rttopo test +xls +xml"

RDEPEND="
	>=dev-db/sqlite-3.7.5:3[extensions(+)]
	sys-libs/zlib
	geos? ( >=sci-libs/geos-3.4 )
	proj? ( sci-libs/proj:= )
	rttopo? ( sci-libs/librttopo )
	xls? ( dev-libs/freexl )
	xml? ( dev-libs/libxml2 )
"
DEPEND="${RDEPEND}"

REQUIRED_USE="test? ( iconv )"

S="${WORKDIR}/${MY_P}"

src_configure() {
	local myeconfargs=(
		--disable-examples
		--disable-static
		--enable-epsg
		--enable-geocallbacks
		$(use_enable gcp)
		$(use_enable geos)
		$(use_enable geos geosadvanced)
		$(use_enable rttopo)
		$(use_enable iconv)
		$(use_enable proj)
		$(use_enable xls freexl)
		$(use_enable xml libxml2)
	)
	econf "${myeconfargs[@]}"
}

src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}