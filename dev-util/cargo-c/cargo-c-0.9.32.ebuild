# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/56dfe34ce1281f6ae5eb5517f7cf03f87bec352c -> cargo-c-0.9.32-56dfe34.tar.gz
https://direct.funtoo.org/eb/01/a5/eb01a5ab563abf8e0e932adafacdee91eadf2e94917782a3cb42e8a166ad7572020dc243706bbd12e804db8c497168589327ae423e3828973f5cee0b52506816 -> cargo-c-0.9.32-funtoo-crates-bundle-952de61ffdfdedefdfb5c0436dc57385177b72097dafc2e40d05f364aa77b2d9c633a38a069ff1ec672c86bec61dd1d3849228bf9de7a5d22aee0840dbf958d3.tar.gz"

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