# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/d646b23f000d099d845f999c2c1e05b15d9cdc78 -> rust-analyzer-20251201-d646b23.tar.gz
https://direct.funtoo.org/28/78/c4/2878c4a492e72d0ff6f51bfd1b48422943d3561b9cf44d813ff05f8519fe389c36f80323a31c856e9a4f557dbc2a0ea1b6daca6184031e18df8a174a7460d510 -> rust-analyzer-20251201-funtoo-crates-bundle-3d2467401191583a0a5f4402fda7ac2ff6a72e752e9ed62728c654c69113e7dbb8cd6555f3d4619b967656944a7dbd57d056851c298a4743560d473154137ef2.tar.gz"

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