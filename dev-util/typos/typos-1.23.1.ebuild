# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/81a34f1ca2d0bfdcc3470c0f279a20333cb94878 -> typos-1.23.1-81a34f1.tar.gz
https://direct.funtoo.org/68/a7/c6/68a7c6c06eace8c35a35cdc07eb4929f65f50edde18ebd9aeea93c9e92a6452bc490931c02e973541dd2afd6c99b5c03ce2c0310569500c9a48ef57861bb2f3a -> typos-1.23.1-funtoo-crates-bundle-e7ce1e865f26a88c8a8384b51417c6d5e512c64564aece060ed3e60d1480b7d15db8c3532114c241e7ded3b320efc0d561f473866f20c272d19c317212622ad5.tar.gz"

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