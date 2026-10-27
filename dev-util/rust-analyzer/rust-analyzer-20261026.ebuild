# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/0c4d74686b21f2b3bd8872b6d3cf36ad2e740d49 -> rust-analyzer-20261026-0c4d746.tar.gz
https://direct.funtoo.org/0d/a5/4f/0da54f62782f07fbfb5e3f85c82e3fca2003b92fe545813c5432495d7ae87f58d0c7ae646ffd063a784fcecaa0d8cf63c45f742d0d1959c1a1c6f2467389661e -> rust-analyzer-20261026-funtoo-crates-bundle-1005910d73f2d083920334de8bd6fabe5a77bb9834ab940beda16acb4ae312bd3d62922b8c6f6f17097b9f7a048ca5fdce42c8718f0e4cca4c1284d0560485e1.tar.gz"

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