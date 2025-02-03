# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/f3998f7f8a197596c5edf72e937996e6674b423b -> rust-analyzer-20250203-f3998f7.tar.gz
https://direct.funtoo.org/94/fd/12/94fd12b53ff1e61383737e266606e7c4561efbfa54715f3dd5afd91b9ba976c8bf34944d56518bff780859e65da5e02008948c48566484b31ab8c02b1cd28706 -> rust-analyzer-20250203-funtoo-crates-bundle-d20a5297cbdb8caf4d53d0d0da8ef42f205352dbdf0582f1bd69a90e26ca8f1b832059b799c28157a10d4fb5a4b68b4b262d3db9547c7827196208a1e4903dc2.tar.gz"

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