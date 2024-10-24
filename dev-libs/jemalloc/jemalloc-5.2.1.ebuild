# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit autotools

DESCRIPTION="Jemalloc is a general-purpose scalable concurrent allocator"
HOMEPAGE="http://jemalloc.net/ https://github.com/jemalloc/jemalloc"
SRC_URI="https://github.com/jemalloc/jemalloc/releases/download/5.2.1/jemalloc-5.2.1.tar.bz2"

LICENSE="BSD"
SLOT="0/2"
KEYWORDS="*"
IUSE="debug lazy-lock prof static-libs stats xmalloc"

HTML_DOCS=( doc/jemalloc.html )

PATCHES=( "${FILESDIR}/${PN}-5.2.0-gentoo-fixups.patch" )

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	ECONF_SOURCE="${S}" \
	econf  \
		$(use_enable debug) \
		$(use_enable lazy-lock) \
		$(use_enable prof) \
		$(use_enable stats) \
		$(use_enable xmalloc)
}

src_install() {
	emake DESTDIR="${D}" install

	if [[ ${CHOST} == *-darwin* ]] ; then
		# fixup install_name, #437362
		install_name_tool \
			-id "${EPREFIX}"/usr/$(get_libdir)/libjemalloc.2.dylib \
			"${ED}"/usr/$(get_libdir)/libjemalloc.2.dylib || die
	fi
	use static-libs || find "${ED}" -name '*.a' -delete
}