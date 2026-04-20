# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/adef948679e1f550805eeb2a78d10e25c0279f54 -> rust-analyzer-20260420-adef948.tar.gz
https://direct.funtoo.org/96/c2/2c/96c22ccc1d5bc8de5a87e37f47a1e0506dfd53a22ffb8204601c60f95186ab5ac29ee8bd9927a40c436398c011d5779235beaa5676ed10892862af29d0e07a71 -> rust-analyzer-20260420-funtoo-crates-bundle-4961db1d907242a19b0317b7975d34015f7f13cb21fe002069d61ba3f28a18a9ec898408cd1f072875e77d0ad89752a3caa82829bbf5b9683dfd82ab428b1eb4.tar.gz"

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