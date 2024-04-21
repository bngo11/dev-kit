# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b140d7ca93d0ca734552866b205ac525fb13c67d -> cargo-c-0.9.31-b140d7c.tar.gz
https://direct.funtoo.org/af/f4/6f/aff46f7514b4e6bd46366b7c8dfac9dee42d79085380d477d7cbc61f9816118cd7e1f1d2d3cd8482fa2cae9e23b996b9b07e792743d22385da94926818f7958e -> cargo-c-0.9.31-funtoo-crates-bundle-d091aba71e400ee0991c4de408ae38cac80b5be72e9e18059b5891aed25cfd2e6c18d8a2c820505b83fab9fcb682be3a3409be25e2f6afc14e47089770dad90b.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="sys-libs/zlib
	dev-libs/openssl:0=
	dev-vcs/git
	net-misc/curl[ssl]
"
BDEPEND="virtual/rust"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/lu-zero-cargo-c-* ${S} || die
}