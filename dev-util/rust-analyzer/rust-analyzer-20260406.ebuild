# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/38fb8f92ac15853d7fa9fb47fc2d81fdd5cd6c7e -> rust-analyzer-20260406-38fb8f9.tar.gz
https://direct.funtoo.org/3a/0b/d6/3a0bd6e39939662d0b7cf81c31ea5cc0a25c3e92ddbb4ad70d724ff7a404dc912d1b1559f64f336ad9e197cc9c30c45efe56687181ba64dc42d5d3f91b5a64a9 -> rust-analyzer-20260406-funtoo-crates-bundle-ab3100fee6fa30102f5733a26a63ac2361bd2556f7757767c3ebd9e004744531a73712af70f9c538e222e092312c062b22310c33fca233e14c51141f980e5d75.tar.gz"

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