# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/65120634e79d8374d1aa2f27e54baa0c364fff5a -> typos-1.42.1-6512063.tar.gz
https://direct.funtoo.org/f3/55/f1/f355f17dc4a13d1d69488931487474d90b13d07e56633002626f4ecec0f61a20a46da48344102e6757bc4a910849311c8dddefca26f6f8bf49d479b488b98697 -> typos-1.42.1-funtoo-crates-bundle-5cac3f75ed1dba4a5d06acaf2e1a9360a9459d94a34c981b459636ce60b2c25c742e23788bcb371f5306079904d56e11e087c20a548b09245390aaaec5c26348.tar.gz"

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