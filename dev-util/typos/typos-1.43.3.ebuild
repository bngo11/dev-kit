# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/9066e9940a8a05b98fb4733c62a726f83c9e57f8 -> typos-1.43.3-9066e99.tar.gz
https://direct.funtoo.org/4d/b8/36/4db836121f3a43d5f250e3cdf99fb941790cec93ecbfca64ed8960020c336dc4601eda328f37832c04c15a8fba9be6ed1f50d4a890b513331ecdcef7cc96ba37 -> typos-1.43.3-funtoo-crates-bundle-2c5b4617e41a25ac5446f3fc7b7832d244b50138041d738a31a729a7510ab96cc1e6716ad9cf8d19fb4edbef75a28c7eefe31795693ccb6d8aea67f7d52e47b7.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/typos"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/crate-ci-typos-* ${S} || die
}

src_install() {
	exeinto /usr/bin
	doexe target/release/typos

	local DOCS=(
	docs/design.md
	docs/reference.md
	CHANGELOG.md README.md
	)
	einstalldocs
}