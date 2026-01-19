# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/080e70378c543d26a3a817899cb66934ba76360b -> rust-analyzer-20260119-080e703.tar.gz
https://direct.funtoo.org/37/63/04/376304a7b1e9ba4abc255593cdc387603678df42385a5e08dfbe3984b85590cbb3d946cec5f897a7fb5854c48d070bdd8a0f82d717e52c3b016da6b2764727e1 -> rust-analyzer-20260119-funtoo-crates-bundle-b5d7923f3ce6487804f969637f20678b51717175b490aa534879359b08219d131c7f2775a5ac2fa37fe7d64d43daf5b6820c9e0d94550382397fe4d6d84bbec8.tar.gz"

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