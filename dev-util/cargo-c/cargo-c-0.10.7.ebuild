# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://direct.funtoo.org/ba/10/05/ba100502d74cf703953f28d9949664a9f122a788ef7182cac305d4bdf83da9218fbc5da54828eb022da66d50baba775a5afb206df2990c3dc74575046fd68f43 -> cargo-c-0.10.7-funtoo-crates-bundle-c8a0890c7c32e9f01036a5023ba96a412cd843e7a703425e0e77b440de01186ff5b8ccc3fa5edae3ea5264b7626fd6fd4ba7d1432b3ebca2361647e455a44af7.tar.gz"

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