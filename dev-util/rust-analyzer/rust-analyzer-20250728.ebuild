# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/db02cdc7fc8b0e0b9aa1be4110a74620bbac1f98 -> rust-analyzer-20250728-db02cdc.tar.gz
https://direct.funtoo.org/df/bb/3a/dfbb3a3ebccc06a4d3a34a0e2dd1f4e2cb280a80c7a5d70c5b8c897bdcf5c610fa62d6352c61bada6dca24ef77945379a052395e9169a79d2e781a64366e7b56 -> rust-analyzer-20250728-funtoo-crates-bundle-b19df4e5887b7d9a24ae45584386201d4abdc05d63c48df0101a964d2dc21711f3f5d21e3734b12b032e15e1eaa8e116b218e09bf11dedb25a263137380964c1.tar.gz"

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