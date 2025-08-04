# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/8d75311400a108d7ffe17dc9c38182c566952e6e -> rust-analyzer-20250804-8d75311.tar.gz
https://direct.funtoo.org/e8/0a/35/e80a35b227a908c74be479408c67ae70361240ce148ffcca572eac689b77aa6551c354595e9e0af8fbd7401c3fa5c8ea5df51df06500f8170144f16c853a5624 -> rust-analyzer-20250804-funtoo-crates-bundle-10feb79160938f0be186c492297b9be779660d7fefb34baf2b3ea909f4b6a1f1669426860dc349726314b20a8d6f341c6a035bb6dfad4fc4b160b8bca16bbcb8.tar.gz"

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