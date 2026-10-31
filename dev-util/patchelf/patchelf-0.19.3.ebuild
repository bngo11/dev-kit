# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Small utility to modify the dynamic linker and RPATH of ELF executables"
HOMEPAGE="https://nixos.org/patchelf.html"
SRC_URI="https://github.com/NixOS/patchelf/tarball/2b4b49d36b62690860414dd127f567be4f1f3208 -> patchelf-0.19.3-2b4b49d.tar.gz"
SLOT="0"
KEYWORDS="*"
LICENSE="GPL-3"

S="${WORKDIR}/NixOS-patchelf-2b4b49d"

src_prepare() {
	default
	rm src/elf.h || die

	sed -i \
	-e '/\(Elf_Off.*getPageSize())\)/s@getPageSize())@alignStartPage)@' \
	src/patchelf.cc || die

	sed -i \
	-e '/\(auto segEnd.*getPageSize())\)/s@getPageSize())@alignStartPage)@' \
	src/patchelf.cc || die

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