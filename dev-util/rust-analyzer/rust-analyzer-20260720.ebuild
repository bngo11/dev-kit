# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/cac0779549328e4bd4b808000c03307f1721f869 -> rust-analyzer-20260720-cac0779.tar.gz
https://direct.funtoo.org/4f/82/e1/4f82e12283ddc1672c3139dfedf34981944ca84bb496b5d2966233089a6e3fb63c7ee1795b2d91aae2636b67b8f4b52eb9f5042add1c757fdd33deb61230f79d -> rust-analyzer-20260720-funtoo-crates-bundle-ce9c35fc1ad78a4f8c0f45a379b423826393d2b6eea283368d08ce71cf3053d0e735eac32b24e3d3794dd5d16d8c4d60bcc674fac7b9dbac4e23398cbf4bc955.tar.gz"

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