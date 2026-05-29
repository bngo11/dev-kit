# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/f8a58b6b53f2279f71eb605f03a4ae4d10608f45 -> typos-1.47.0-f8a58b6.tar.gz
https://direct.funtoo.org/69/29/c4/6929c4a08e2f3bcbc5ec7b95187128a874a7dc1292950131e9f9dff1583cc3bff6fdfd59591055a43875244ae735e863af40bd0fc58158a749610d909aff0382 -> typos-1.47.0-funtoo-crates-bundle-1a814fc5c06fac19e903102ade83a31a70338a1d23192a5c18bc0b4defeb38c5b4dc82a1de27fd9381ce4fbe978b213cda2080df61bee0a35e10d3fcfb3d8929.tar.gz"

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