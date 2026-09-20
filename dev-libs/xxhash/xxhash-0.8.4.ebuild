# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="Extremely fast non-cryptographic hash algorithm"
HOMEPAGE="https://xxhash.com/"
SRC_URI="https://github.com/Cyan4973/xxHash/tarball/c87183a77d67f7d37e3d2d1b7eaac5e7c695e4f0 -> xxHash-0.8.4-c87183a.tar.gz"
S="${WORKDIR}/Cyan4973-xxHash-c87183a"

LICENSE="BSD-2 GPL-2+"
SLOT="0"
KEYWORDS="*"

src_install() {	
	local emakeargs=(
		DESTDIR="${D}"
		PREFIX="${EPREFIX}"/usr
		LIBDIR="${EPREFIX}"/usr/$(get_libdir)
	)

	emake "${emakeargs[@]}" install
	einstalldocs

	rm "${ED}"/usr/$(get_libdir)/libxxhash.a || die
}