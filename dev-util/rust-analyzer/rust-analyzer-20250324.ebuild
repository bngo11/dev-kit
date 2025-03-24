# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/37acea8052d5d27e7f1312d9e6e743a9da176c21 -> rust-analyzer-20250324-37acea8.tar.gz
https://direct.funtoo.org/30/0f/74/300f74c49c15bcfcbcd2a42a7f76b7822b31745f1f6b4f6aeccf86c008990f40189cffceb5ac990f4b30d9214ee53f61370bc42046a10a65f24dbc19c5cb0985 -> rust-analyzer-20250324-funtoo-crates-bundle-6820faf0b530ddbb5276a2ceab02f5d7303aebbed13869b509372a559a36ebdb8c3fdb656056b04e32bb515616b775763ead6d5421dd653467a1e149a58e5e3f.tar.gz"

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