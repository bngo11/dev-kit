# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/6d35b835f6f431bbe715c4c1ccd2c7d3264e11fb -> typos-1.37.0-6d35b83.tar.gz
https://direct.funtoo.org/d5/e4/1c/d5e41cc8c6ba8f2f00930138f8acd6841c06de0c49714d893cfc2a8d6b93f68f3920a1e05b43b23888bda3f8735286e587330f66bfc73f4bbf7633046adfc08e -> typos-1.37.0-funtoo-crates-bundle-80cc8c58df4efdb888910585f492226cc6caf692d9d17d35f6a7b9dfd6c7b338a765d9f06391b97f0fc9796070104473942a4a5b77514907e55ce9fe412d86dd.tar.gz"

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