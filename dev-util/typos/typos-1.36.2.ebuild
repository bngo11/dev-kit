# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/85f62a8a84f939ae994ab3763f01a0296d61a7ee -> typos-1.36.2-85f62a8.tar.gz
https://direct.funtoo.org/5f/80/43/5f8043cee63e0a742e3e4b4b38dad3ec7d9098283f02a89f49b84bb151f3b0b40149e6157ed8d7b473141f087ed8346fc6aa4c17dca70bd939eed10c47c7aa76 -> typos-1.36.2-funtoo-crates-bundle-80cc8c58df4efdb888910585f492226cc6caf692d9d17d35f6a7b9dfd6c7b338a765d9f06391b97f0fc9796070104473942a4a5b77514907e55ce9fe412d86dd.tar.gz"

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