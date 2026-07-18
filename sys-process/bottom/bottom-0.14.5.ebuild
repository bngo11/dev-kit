# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/4023340c2b124b8960523181788e105d5b6a0ffe -> bottom-0.14.5-4023340.tar.gz
https://direct.funtoo.org/f9/4b/44/f94b444e1b2243f51597e809f61c41710d069e560a9e4c14d05da9e7081e93227d2e02359803989f75fde76f67021ed34791ce50c7a1023811754417b7680e9f -> bottom-0.14.5-funtoo-crates-bundle-29458b1f17dd7ee1b2c59ba50e1541abfc4c67d36486f7a6b21dbcdc3e4025eceaf6a74a729047c34116e51c9b2327400ab7d8e285f16e76d571a8f79b35600b.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

DOCS=( README.md CHANGELOG.md )

QA_FLAGS_IGNORED="/usr/bin/btm"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/ClementTsang-bottom-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}