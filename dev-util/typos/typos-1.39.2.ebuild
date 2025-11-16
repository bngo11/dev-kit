# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/626c4bedb751ce0b7f03262ca97ddda9a076ae1c -> typos-1.39.2-626c4be.tar.gz
https://direct.funtoo.org/10/f0/ce/10f0ce5c49b31a703d7968a6d220dd7fc719562579ef504e8adcf2bda442bd5676e62b2e5e53004dc80d23f24db71924f43d18fafba8c99f2b0095157254028a -> typos-1.39.2-funtoo-crates-bundle-1bcaf64f1a2806e84e96556707993224686a11c8eb0f44e43cb6c7ae22f9a301b2550963051e319b6eb1338b4fcbaa131833f1a77bb5e56878f88ddf36fc9b7d.tar.gz"

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