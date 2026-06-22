# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/69ccffdb5b3570c6c14c5780bf2e8836f2209d90 -> rust-analyzer-20260622-69ccffd.tar.gz
https://direct.funtoo.org/fb/3c/4f/fb3c4f0cbe47a1d404d8593fed34d6c3273c46ea4c0aae990a1a4e89a492ac88c9db8472a7c193dd2f4c9ab461e9d7d9eca3f4f099c58e371a76690b95b8531d -> rust-analyzer-20260622-funtoo-crates-bundle-c47d79e41321707475ac5c8d558bda25c770336ca905b5daa0bb36825714df7d06b2453e7182de0c3f7a56d94a44643030b849df5d2c1312f80818375e74adc6.tar.gz"

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