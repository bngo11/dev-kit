# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/d43b6c087ac471e2ea7b8af622ff15f05c0c365b -> typos-1.50.1-d43b6c0.tar.gz
https://direct.funtoo.org/b6/30/fe/b630feb357856873b7b1fabf1af9bd1a8174c47b9f8808b7d9813126494744c378ed82be0e60e2aff617ed0d1109de2bd845cbba3d779b3bf362e408d7c3a8c4 -> typos-1.50.1-funtoo-crates-bundle-aa49f8cc5cf9141e3d9da88f4fe5abef0f3bbb04b212f06a2d7c3a598213a824aae666438849afd1051d473429bea45a2b3f46604f383f1ad502956d49e5ee19.tar.gz"

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