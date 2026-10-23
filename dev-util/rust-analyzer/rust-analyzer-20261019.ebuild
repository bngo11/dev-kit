# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/5ec20d044dbf04895877a55921ddc0ae6e73e127 -> rust-analyzer-20261019-5ec20d0.tar.gz
https://direct.funtoo.org/e5/fc/7e/e5fc7e01c40f53caff2be6cf9c9d85cac9045ded3f61700cf4d9b3f3111cfb5648e4388f266e864624ac2810ae7c3d9943b643c4d766cf23234346e909da8ffd -> rust-analyzer-20261019-funtoo-crates-bundle-1005910d73f2d083920334de8bd6fabe5a77bb9834ab940beda16acb4ae312bd3d62922b8c6f6f17097b9f7a048ca5fdce42c8718f0e4cca4c1284d0560485e1.tar.gz"

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