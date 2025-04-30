# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/3be83342e28b9421997e9f781f713f8dde8453d2 -> typos-1.31.2-3be8334.tar.gz
https://direct.funtoo.org/24/5e/b6/245eb6a89aaf19eb65d4749d84096f7bcf24679b3153fb3edfefda651a3a3110f4c4b93eb7909d4303e66b4e731183c02f1a6328e87f9d7b8972464e68b1e477 -> typos-1.31.2-funtoo-crates-bundle-6663759a2cf3e44f7f74e6c40923d104dff101075d009f0352bc6f02105815173ce36506889fef0afe5875b1bd42580a49104f7f6774f051270653e9abe98a36.tar.gz"

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