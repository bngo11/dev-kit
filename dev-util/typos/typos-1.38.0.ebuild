# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/83157de2df0fa7c7ae20f73f9dbed44c41f2bb64 -> typos-1.38.0-83157de.tar.gz
https://direct.funtoo.org/a9/1f/21/a91f21eaa6cfeaded1b9a3a794a9f087e07c83ffb893f0f60ce45d2bdbd8fa64bb062007b292bd0dd1a1f3c995eef736bc0854c9d950c110c62f62d9da4f9b3e -> typos-1.38.0-funtoo-crates-bundle-4d9f339a14a56700ef1801e741816853c8992f3b4120740954af1438e676c75cbb5f8a19f6535c694985fd893166d5a892f08002d6bd75dd0d4e38eb9b5394f3.tar.gz"

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