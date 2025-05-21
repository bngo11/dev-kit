# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/e464ff8c755c6e12540a45b83274ec4de4829191 -> rust-analyzer-20250519-e464ff8.tar.gz
https://direct.funtoo.org/48/a8/da/48a8da814cb718a07f7f926c37d5d5ecdb68b74fa73049144bcb3e9891809e2ffac5944667480c9809582181ddc55390191d91fea1e68f9b4f1299e1f3f54619 -> rust-analyzer-20250519-funtoo-crates-bundle-558ca4b79f1b6e803dad75a7fca57e8403d37cdfd9874d052f4149b5a24ae7abf0b0201d10c258b9a41a9d1bde6e793b1b9346fb443f59422a649d276adc9220.tar.gz"

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