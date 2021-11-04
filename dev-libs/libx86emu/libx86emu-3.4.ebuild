# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="A library for emulating x86"
HOMEPAGE="https://www.opensuse.org/"
SRC_URI="https://github.com/wfeldt/libx86emu/archive/3.4/3.4.tar.gz -> libx86emu-3.4.tar.gz"

LICENSE="HPND"
SLOT="0"
KEYWORDS="*"

src_prepare() {
	default
	sed -i -e '/^GIT2LOG.*\|^GITDEPS.*\|^BRANCH.*\|^VERSION.*\|^MAJOR_VERSION.*/d' Makefile || die
}

src_configure() {
	tc-export CC
}

src_compile()
{
	emake VERSION="3.4" MAJOR_VERSION="3" shared
}

src_install() {
	emake DESTDIR="${ED}" LIBDIR="/usr/$(get_libdir)" VERSION="3.4" MAJOR_VERSION="3" install
	dodoc README*
}