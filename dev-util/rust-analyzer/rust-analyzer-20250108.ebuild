# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/238ccb628bd4a9833fc4645b000ac585bcccf582 -> rust-analyzer-20250108-238ccb6.tar.gz
https://direct.funtoo.org/de/bd/03/debd03e9e38bc61a130fb04bc851a2d10b088c6e18a6325dc90493a7fdff50df4d7717344954bf316e7c670addf08bb0344063f2ad74fc07b9926a029434a35d -> rust-analyzer-20250108-funtoo-crates-bundle-370049bf8af50aa653e7d39a532ee4639ed4ca124ac22503c46c680899ad79113bddf842da9d868678271e2e3ae23c4c77e6f0acb41200b42fd7d690c0303282.tar.gz"

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