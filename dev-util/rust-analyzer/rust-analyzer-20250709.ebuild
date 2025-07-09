# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/e429bac8793c24a99b643c4813ece813901c8c79 -> rust-analyzer-20250709-e429bac.tar.gz
https://direct.funtoo.org/32/1f/82/321f82fed0bcdbdd420917d013beee924ddeb24749812fac4cf22d5e8f6c9b7944ac1daa2f57f38ce74d506931f96fe920536e69ee9686effdc3416f0f5dba26 -> rust-analyzer-20250709-funtoo-crates-bundle-beaf88fa4baa17d1cb8e43e718d7abc5aa3dffe1847ec761a182a24ab507561805d5370b0b978afeaef6b2440ff07adc6e41f7b078f24967b7c884a72494098f.tar.gz"

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