# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3+ )

inherit ninja-utils python-any-r1 toolchain-funcs

DESCRIPTION="GN is a meta-build system that generates build files for Ninja"
HOMEPAGE="https://gn.googlesource.com/"
SRC_URI="https://direct.funtoo.org/e7/0d/0d/e70d0df173913c4e936f92f1c8ff43329d12483615b049a4463c019dccc1d66909e5d070655ef16cbc951828e0c49afb129d1e9a73aa3e09b09f71446ede3c4d -> gn-0.2156.tar.xz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
S="${WORKDIR}/gn-0.2156"

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