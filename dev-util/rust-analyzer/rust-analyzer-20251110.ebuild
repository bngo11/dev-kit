# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/21f8445ea523e83cd4f11b0a67a3a5ced2b1f56f -> rust-analyzer-20251110-21f8445.tar.gz
https://direct.funtoo.org/98/97/95/989795fe50a1b45dc36a05945eedf022cd1fae8fa61b6fe1fe935c16e3e639692ab14fc2f58e0e66f63bc0a4e88951503d0329a6efc19c66f6206d207c6ab207 -> rust-analyzer-20251110-funtoo-crates-bundle-137e1147b5e47e5dfd2c8a40b5b4ca8acfdd7eee5ba1f0c491ad488af076495891f5824bd707b75e7cd0076aad6a56e13c9d8a5a57e15f905daf73c1967ec36f.tar.gz"

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