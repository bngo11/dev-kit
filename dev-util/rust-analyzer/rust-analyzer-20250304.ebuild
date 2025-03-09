# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/02862f5d52c30b476a5dca909a17aa4386d1fdc5 -> rust-analyzer-20250304-02862f5.tar.gz
https://direct.funtoo.org/3f/03/27/3f032705396219c9b7f7a4bd870aa6a974af98bd0e016e256f040ffcc94e44cfb3a905e639d96b81a6cae6e311c45227d4a564f036a8f35153dd415e32a5e03a -> rust-analyzer-20250304-funtoo-crates-bundle-50b6d425f722fc927a9275d16fd503b5909c40ba89cc7d8e415e972e6f9635e0413bfea4cc3ef44a66655c8dc23ff2df5d2f7d22a2da0437f7f806b5a8bf394e.tar.gz"

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