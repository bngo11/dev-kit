# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3+ )

inherit ninja-utils python-any-r1 toolchain-funcs

DESCRIPTION="GN is a meta-build system that generates build files for Ninja"
HOMEPAGE="https://gn.googlesource.com/"
SRC_URI="https://direct.funtoo.org/55/ba/9c/55ba9c8f91938911f961b0c3a29ee548e16e9b2b85c11bafb07a333c6179810dbf733d22a14b79952bcee0293e51362d4e9ac26e9fd1d59295eb78a9f7eb9961 -> gn-0.2143.tar.xz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
S="${WORKDIR}/gn-0.2143"

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