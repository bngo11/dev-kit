# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="An efficient, principled regular expression library"
HOMEPAGE="https://github.com/google/re2"
SRC_URI="https://api.github.com/repos/google/re2/tarball/2022-02-01 -> re2-2022.02.01.tar.gz"

LICENSE="BSD"
# NOTE: Always run libre2 through abi-compliance-checker!
# https://abi-laboratory.pro/tracker/timeline/re2/

SLOT="0/9"
KEYWORDS="*"
IUSE="icu"

BDEPEND="icu? ( virtual/pkgconfig )"
DEPEND="icu? ( dev-libs/icu )"
RDEPEND="${DEPEND}"

DOCS=( AUTHORS CONTRIBUTORS README doc/syntax.txt )
HTML_DOCS=( doc/syntax.html )

fix_src_dirs() {
	pushd "${WORKDIR}"
	mv google-re2-* re2-2022.02.01
	popd
}

src_unpack() {
	default
	fix_src_dirs
}

src_prepare() {
	default
	grep -q "^SONAME=9\$" Makefile || die "SONAME mismatch"
	if use icu; then
		sed -i -e 's:^# \(\(CC\|LD\)ICU=.*\):\1:' Makefile || die
	fi
}

src_configure() {
	tc-export AR CXX
}

src_compile() {
	emake SONAME="9" shared
}

src_install() {
	emake SONAME="9" DESTDIR="${D}" prefix="${EPREFIX}/usr" libdir="\$(exec_prefix)/$(get_libdir)" shared-install
}