# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/72f3776b6edc3a10a567b8e43fd0524b2a3f1419 -> typos-1.30.1-72f3776.tar.gz
https://direct.funtoo.org/c8/8d/a3/c88da36055ef1a4ccef58877abd23387dcb543ae9a9542833d581d4466497d40a76bf6d1489f62ce1340e60dd096a8a1ffa7a05f87e05b0c59b9bb74ff9ae958 -> typos-1.30.1-funtoo-crates-bundle-64dae1098dbe729ea54f3f6eb30d8553ab97c6a3e57ac91ba7cd2c54bed7aba3014cadc127b0c836ed22d142025e51f116d370d73bcbe7c8e1970ded00cf24d9.tar.gz"

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