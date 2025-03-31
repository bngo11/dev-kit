# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/b1a1ef3893ff35ade0cfa71523852a49bfd05d19 -> typos-1.31.1-b1a1ef3.tar.gz
https://direct.funtoo.org/2a/16/ff/2a16ffb3caef469d1072bfd5acde17fcedd1eefe80d5edc7cd06efdf9d1f43c86cb25e7fe3eff77f28e6717771f0dbe444720afa41f41790ff2f6591af0ecbb7 -> typos-1.31.1-funtoo-crates-bundle-64dae1098dbe729ea54f3f6eb30d8553ab97c6a3e57ac91ba7cd2c54bed7aba3014cadc127b0c836ed22d142025e51f116d370d73bcbe7c8e1970ded00cf24d9.tar.gz"

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