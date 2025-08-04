# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/a9ccf76b53d1ace194871d216f9ff058599a86db -> typos-1.35.1-a9ccf76.tar.gz
https://direct.funtoo.org/e0/42/ea/e042ea761a6ddc87b4cac4221f49cb782009160f991ff197e4d9a189ef724baab049c6602339562aa7a05507c9072d14c7ff7f08344f9455ba8113cb13574ed9 -> typos-1.35.1-funtoo-crates-bundle-9969507b7d0c2d2c6183f85a87e0289a5e4cf17804705cef385ba39936bc7ea9c973cbc0b44b5e4e1e92111d2b53433f9713dd6126e16d730f020f4dc5b1735f.tar.gz"

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