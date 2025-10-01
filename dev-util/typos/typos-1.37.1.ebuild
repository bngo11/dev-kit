# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/40156d6074bf731adb169cfb8234954971dbc487 -> typos-1.37.1-40156d6.tar.gz
https://direct.funtoo.org/8e/1a/db/8e1adbb0a39b5e83e80fb289b7e3e4f06bdc5daf3a0117ba2ff46598427a28f720eb2cd38036d218b4180298bc3359473a803e42ec1a62db89b3569143d9bcdb -> typos-1.37.1-funtoo-crates-bundle-80cc8c58df4efdb888910585f492226cc6caf692d9d17d35f6a7b9dfd6c7b338a765d9f06391b97f0fc9796070104473942a4a5b77514907e55ce9fe412d86dd.tar.gz"

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