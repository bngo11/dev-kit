# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/7f9d0819ca1c008ade73f4b41fa9d258d48f605b -> typos-1.51.1-7f9d081.tar.gz
https://direct.funtoo.org/c2/d6/fc/c2d6fc04a407baa557f75960bd0aeadd11e7c45b0456c60bf6b1eb82bae0db878bb503d4ee8d61036fbb2f3a371b90fd250308923b48927b665c0835fc00448f -> typos-1.51.1-funtoo-crates-bundle-c490ffd1aeb001a647f2dda2b051079f7a44e0f35b44d31e4e8aa327a3131a96f22fd41e8e597f4655413800e7f28235ddb768881401b80046415d7288d24e2c.tar.gz"

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