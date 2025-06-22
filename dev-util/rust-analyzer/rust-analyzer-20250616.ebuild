# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/a207299344bf7797e4253c3f6130313e33c2ba6f -> rust-analyzer-20250616-a207299.tar.gz
https://direct.funtoo.org/5f/92/c4/5f92c4c50f573ea3399546bdccb9390b620ff2aa37fe7502355dcf3296f626126f58c8abce58dc49afbc1dea0e748e4e4ce68c4fbd3219f20de50a8558e70df6 -> rust-analyzer-20250616-funtoo-crates-bundle-93d890fd0a5d3118796742e4c8d1ca20b683d0d8324ee32865109151d1844136f5c57c58be17859ff34a57615e8fb39be3ddbe2100f81fbac95b9f056840c022.tar.gz"

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