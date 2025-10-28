# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/049767e6faa84b2d1a951d8f227e6ebd99d728a2 -> rust-analyzer-20251027-049767e.tar.gz
https://direct.funtoo.org/05/dc/9f/05dc9f7909fa5c81118ac9b25d6cd47a008cc8363259eacb141173b2373c90930cc20383adadb9378b71476b4e8e1d8e9487c9fc1df9edb39c25c606789862b4 -> rust-analyzer-20251027-funtoo-crates-bundle-abc1ab61b5b7e6a58dae30751049fa544b73888e81e84c0951c872b66e28e6b1f65797a3d5213e5a802e961d4c14afdd9c66c1bef49b28f39310d829efbb085a.tar.gz"

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