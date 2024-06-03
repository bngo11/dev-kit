# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/7852a4c775375f438c4ab13c760c69200d8099b4 -> rust-analyzer-20240603-7852a4c.tar.gz
https://direct.funtoo.org/4f/6e/76/4f6e76a4491d3874209ca18fcc8b138c83646eb40ec04eb4406ff883e0b390aa6126cc35cb16744ac761a9e9aaa7a4cb2bd5ac8436f9becbfff9d26519ddfb47 -> rust-analyzer-20240603-funtoo-crates-bundle-226f1c2649f85ce70f1e4b12a440edc479725b00e13f2729ed7a9d1dd0e37e5821850488a266b9bcbd1d36d954247d36e9c3be4d807b1a74f7187884328d86de.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/rust-analyzer"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/rust-lang-rust-analyzer-* ${S} || die
}

# To populate a custom version for rust-analyzer use the CFG_RELEASE environmental variable
# If this is not set rust-analyzer --version will return 0.0.0
# Upstream code reference: https://github.com/rust-lang/rust-analyzer/blob/master/crates/rust-analyzer/src/version.rs
src_install() {
	RUST_VERSION="$(rustc --version | awk {'print $2'})"
	CFG_RELEASE="$RUST_VERSION (-standalone-funtoo)" cargo_src_install --path "./crates/rust-analyzer"
	einstalldocs
}