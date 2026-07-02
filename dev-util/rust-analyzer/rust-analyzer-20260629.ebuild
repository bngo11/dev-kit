# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/972c4e7bee140acd27e26b3e04673bfd05302f89 -> rust-analyzer-20260629-972c4e7.tar.gz
https://direct.funtoo.org/e6/d7/0e/e6d70e0e86992443703aaf03565ca2aa62205c3ae71ba8eeb7404b692b642778fbae8ff5285e526ddb6538070885bd4cee75639d4af4573dd2408257c1ff7f35 -> rust-analyzer-20260629-funtoo-crates-bundle-897567cf4abca5729fdc870db5cb930947a423e0632edb340f355962108de64346898527fc1604e17a7778802b63dd7ae8b79a406305adf914a4cc93a2304c88.tar.gz"

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