# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="A free implementation of the unicode bidirectional algorithm"
HOMEPAGE="https://fribidi.org/"
SRC_URI="https://github.com/fribidi/fribidi/releases/download/v1.0.12/fribidi-1.0.12.tar.xz -> fribidi-1.0.12.tar.xz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="*"

RDEPEND=""
DEPEND=""
BDEPEND="
	virtual/pkgconfig
"

DOCS=( AUTHORS NEWS ChangeLog THANKS ) # README points at README.md which wasn't disted with EAPI-7

src_prepare() {
	default

	export CC_FOR_BUILD="$(tc-getBUILD_CC)"
}

src_configure() {
	local myeconfargs=(
		--enable-shared
		--disable-static
		--disable-debug
	)

	ECONF_SOURCE="${S}" econf "${myeconfargs[@]}"
}

src_install() {
	default
	einstalldocs
	find "${ED}" -name '*.la' -delete || die
}