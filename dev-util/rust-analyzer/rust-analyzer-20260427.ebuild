# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/8954b66d43225e62c92e8bbcc8500191b5cceb1e -> rust-analyzer-20260427-8954b66.tar.gz
https://direct.funtoo.org/9b/89/b5/9b89b5a239accb2fa6f2030f950f1e8eeed4902d0a1e79aac5afd114ea32a5ea246e72c457819b5d448c7d3c551a639ebd1c6f45147f81e545b8230819bdf6c1 -> rust-analyzer-20260427-funtoo-crates-bundle-4961db1d907242a19b0317b7975d34015f7f13cb21fe002069d61ba3f28a18a9ec898408cd1f072875e77d0ad89752a3caa82829bbf5b9683dfd82ab428b1eb4.tar.gz"

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