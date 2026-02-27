# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/631208b7aac2daa8b707f55e7331f9112b0e062d -> typos-1.44.0-631208b.tar.gz
https://direct.funtoo.org/bc/1a/e7/bc1ae780817834b0a206d7952688b04a361a2d7476bc9711a37a57fb2b378d93c5abdadd5bea29ee0c901c87b5664b45d1f48d1c5367ab41b9a74ddcbeb97e5c -> typos-1.44.0-funtoo-crates-bundle-2c5b4617e41a25ac5446f3fc7b7832d244b50138041d738a31a729a7510ab96cc1e6716ad9cf8d19fb4edbef75a28c7eefe31795693ccb6d8aea67f7d52e47b7.tar.gz"

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