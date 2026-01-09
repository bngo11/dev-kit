# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/bb4666ad77b539a6b4ce4eda7ebb6de553704021 -> typos-1.42.0-bb4666a.tar.gz
https://direct.funtoo.org/1f/15/41/1f15410edf52d8bcaaaea8ca43427641276e7f69d2d26e12ba53fc7210816c52a42e2c102985b92f6b684166c5b21672df7c39538c84189624f3eabf1a634ef8 -> typos-1.42.0-funtoo-crates-bundle-5cac3f75ed1dba4a5d06acaf2e1a9360a9459d94a34c981b459636ce60b2c25c742e23788bcb371f5306079904d56e11e087c20a548b09245390aaaec5c26348.tar.gz"

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