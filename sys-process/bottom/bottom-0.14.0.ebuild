# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/ed9ffbc86535ea1c2ba8e51216f6a7e90e0ce84d -> bottom-0.14.0-ed9ffbc.tar.gz
https://direct.funtoo.org/df/62/e9/df62e9efd16fe7c3ceafd7fe98c41144c4a70b9ff4485e10209dcfc2af028cf8d03453414bf45cc5b011bf190a62991f845460b3762a7995fc21cac32c3c40ca -> bottom-0.14.0-funtoo-crates-bundle-109f3f1b3dc72a65d98e64ac74519e38566c3b02a13611a0cb1b3b308e581217bbab7bb0f149e6090204cacea6e1ffac1ce9221e72871a27979ab6773ce24757.tar.gz"

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