# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/566fe415d158452c72feb026f43e8d81e249ccb0 -> rust-analyzer-20260302-566fe41.tar.gz
https://direct.funtoo.org/e0/67/8d/e0678de9985ac18b36ffd0a1cc788067aa251ed93d98d1e6196eef62e71dfc7715a1ee3ebfffcf41294fc2afd479918ff3c84a9c1107ab5080e0ef72f95192e2 -> rust-analyzer-20260302-funtoo-crates-bundle-7c924d7b70d387c37d2193bd93991a37f2bffe77e2c74690c6b8938ba951a2cc390355123a9b0b8e07ee6dc4a50e23b167401ad630c44257968f596153e56891.tar.gz"

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