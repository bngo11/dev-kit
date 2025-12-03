# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3+ )

inherit ninja-utils python-any-r1 toolchain-funcs

DESCRIPTION="GN is a meta-build system that generates build files for Ninja"
HOMEPAGE="https://gn.googlesource.com/"
SRC_URI="https://direct.funtoo.org/b6/3e/3c/b63e3c9ffebae6369cbb9f6fc406c30e69f437a69390501f9a1e1a205cf2d646f7ade5c4852a4c698f14ff675c5892be26408a6289f1f3fa5baefcabf2ed349a -> gn-0.2307.tar.xz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
S="${WORKDIR}/gn-0.2307"

BDEPEND="
	${PYTHON_DEPS}
	dev-util/ninja
"

pkg_setup() {
	:
}

src_configure() {
	python_setup

	tc-export AR CC CXX
	unset CFLAGS

	set -- ${EPYTHON} build/gen.py --no-last-commit-position --no-strip --no-static-libstdc++ --allow-warnings
	echo "$@" >&2
	"$@" || die
}

src_compile() {
	eninja -C out gn
}

src_install() {
	dobin out/gn
	einstalldocs

	insinto /usr/share/vim/vimfiles
	doins -r misc/vim/{autoload,ftdetect,ftplugin,syntax}
}