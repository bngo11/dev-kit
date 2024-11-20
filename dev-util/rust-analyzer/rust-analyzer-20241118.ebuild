# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/ba56d9b9b5f7ae7311b4bd1cc47159d87eb033d0 -> rust-analyzer-20241118-ba56d9b.tar.gz
https://direct.funtoo.org/d4/bf/fa/d4bffa186aa242a1d8bb69edd9a5f5d54793d0075ebc346ea2c72729f715f74cfe7373abef3a0586628c3691b084d171b2041709f79815f2290d261f0bcf36c7 -> rust-analyzer-20241118-funtoo-crates-bundle-f51580b109c30f98879e241149608535d9884690abb51411c2e629ae9eb12279aa403c8b81db465c3cb8fb991e0a701e84c63c11b47f53d1737f30645dc95b56.tar.gz"

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