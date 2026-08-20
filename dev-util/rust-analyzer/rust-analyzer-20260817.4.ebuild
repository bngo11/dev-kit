# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/bb3bbbd9e4529cbf1a6392d5953f03eb01af3792 -> rust-analyzer-20260817.4-bb3bbbd.tar.gz
https://direct.funtoo.org/60/a0/fd/60a0fd1fa2cf5172557b1b9e09dbe37891bebb274cce49c2b243e5097b27e44796c1d6c4d7367d8e4b26bf4aa12a45807a33eb0c7cf59206651171618d9f9216 -> rust-analyzer-20260817.4-funtoo-crates-bundle-b0925c9c5453af6ba68ad5e7822811f1ec5c1f900c3ae1ea7e93d204b16be7c39a18bc33bad214e5d2a2169d0a2f5d39394e965136f3e4a6a8cc32fe1423a53b.tar.gz"

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