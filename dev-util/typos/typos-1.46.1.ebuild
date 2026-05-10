# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/5374cbf686e897b15713110e233094e2874de7ef -> typos-1.46.1-5374cbf.tar.gz
https://direct.funtoo.org/9b/87/ec/9b87ec66de49fd62b07c660c8553922740540e3a047be048e62ef41d0d771f408100a8fc410192ddc965abad3c95ec85ee5060525af35864a53a8e40059c5a3a -> typos-1.46.1-funtoo-crates-bundle-1a814fc5c06fac19e903102ade83a31a70338a1d23192a5c18bc0b4defeb38c5b4dc82a1de27fd9381ce4fbe978b213cda2080df61bee0a35e10d3fcfb3d8929.tar.gz"

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