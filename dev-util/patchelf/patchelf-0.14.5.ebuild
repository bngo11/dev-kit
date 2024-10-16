# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Small utility to modify the dynamic linker and RPATH of ELF executables"
HOMEPAGE="https://nixos.org/patchelf.html"
SRC_URI="https://github.com/NixOS/patchelf/archive/0.14.5.tar.gz -> patchelf-0.14.5.tar.gz"
SLOT="0"
KEYWORDS="*"
LICENSE="GPL-3"

src_prepare() {
	default
	rm src/elf.h || die

	sed -i \
		-e 's:-Werror::g' \
		configure.ac || die

	# FL-9115: add missing import for optional
	sed -i \
		-e '1s/^/#include <optional>\n/' \
		src/patchelf.cc

	eautoreconf
}

src_test() {
	emake check \
		  CFLAGS+=" -no-pie" \
		  CXXFLAGS+=" -no-pie"
}