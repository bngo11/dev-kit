# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/51f257b946f503b768e522781f56e9b7b5570d48 -> typos-1.29.7-51f257b.tar.gz
https://direct.funtoo.org/6c/e4/9a/6ce49a8321f585c0ce32767c056fb08550b6234174840dd1eb7851edc3166352129301c823816fce6d5b0d0c9de01fd8638a3fe92acca48641d9294eb8bb30e6 -> typos-1.29.7-funtoo-crates-bundle-e88ff7b5d21442d552de79d655135b739859c092180539e2ffcafee2b3a9a20be5b1b0238b1c41dfe7de7d90214695fccb39274490290ecaabe6dd2f9b5b8b3b.tar.gz"

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