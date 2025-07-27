# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/58e507d80728f6f32c93117668dc4510ba80bac9 -> rust-analyzer-20250721-58e507d.tar.gz
https://direct.funtoo.org/ed/27/03/ed270357233301b03976beb3eb92225082e9b46f6ced58fd8d8f8d718f837850e4071b86382fd88ab12c3dcb8b954353bf636803671f3fc4e6b2f4d5fd088be6 -> rust-analyzer-20250721-funtoo-crates-bundle-ade6742eea3042733999eb0397703741c00da86ec902007fa99aa9caec581593db1ed64a7316714205f1ee66d9ad3addb19e54b5c3dc6256167b85b1e9e4bdde.tar.gz"

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