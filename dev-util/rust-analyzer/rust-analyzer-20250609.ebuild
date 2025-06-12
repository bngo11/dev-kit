# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/9fc1b9076cf49c7f54497df9cfa4485a63f14d3e -> rust-analyzer-20250609-9fc1b90.tar.gz
https://direct.funtoo.org/69/b4/7f/69b47f87f053c99e93aa3576468adf1881569588082522b5216dc76797a05953cc934839d296f13edfd1f9865d0db2ce6b8809d83fd86d45ece73ef2f71e9416 -> rust-analyzer-20250609-funtoo-crates-bundle-322fd17ac1a458c49cc9af55b80ec30acf64c41acd7436c01783823dd59408486eba268490799af8d6b40f68f43b3e6d14e8a20606c6387b8e8adb03b92ed716.tar.gz"

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