# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/fd74511f34ae6c165466543cc6e55ea60e7365af -> rust-analyzer-20240729-fd74511.tar.gz
https://direct.funtoo.org/e2/ed/98/e2ed9846f14156820f9f07a5fb6e54a58444919750537ae83db137831a73f356252be25863601190522d61bd9bc40c51a8e7c6e535211d5af8d0ada743f44986 -> rust-analyzer-20240729-funtoo-crates-bundle-faea7c031240d6657532aa2e1871d4d6c953b44d12ce47ba1f438fb923f3412a74ea5663a54c969208d5eb94aec771b23096dbb9c2f5daae07b2f9da456ec77f.tar.gz"

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