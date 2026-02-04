# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/3a4d65230db538caabac6e156599c8ba8380ff07 -> typos-1.43.1-3a4d652.tar.gz
https://direct.funtoo.org/59/6d/a5/596da55fcb74080c030485a9871d49c19c973060978ed0c40116111e3eea13864ff8ef33a0debac614fc858b03eabd7100c842d27f781e5e1b8c2c17a4fdea05 -> typos-1.43.1-funtoo-crates-bundle-2c5b4617e41a25ac5446f3fc7b7832d244b50138041d738a31a729a7510ab96cc1e6716ad9cf8d19fb4edbef75a28c7eefe31795693ccb6d8aea67f7d52e47b7.tar.gz"

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