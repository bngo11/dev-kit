# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/2f102bc1aa7fcd05f40e616c743804295300a490 -> bottom-0.10.1-2f102bc.tar.gz
https://direct.funtoo.org/59/ed/8a/59ed8aad124a98cff29efb094dfacf3b2ce981e726457fc78e840119501cdf0297495cf2f9018f4e2661af9d2f9c370a61d5d21909f6bb4bda11d074776a5697 -> bottom-0.10.1-funtoo-crates-bundle-e934c30018c7ddff2c4105470742a48afd70f012b242ad29c8e9c7f186e0bbc52c848c612ac7fb13ae57ea8c4aa070fb3107cd8032dc9fe238d6a4260b4e3fd7.tar.gz"

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