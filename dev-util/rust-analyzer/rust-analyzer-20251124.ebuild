# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/4a2b38f49f2c15f4302502027b6ac09914679a8f -> rust-analyzer-20251124-4a2b38f.tar.gz
https://direct.funtoo.org/09/55/1e/09551e3fb94fd70fd9b39da97a6439ef47081a0b72c7db114d0cc4ba97b5efeee685d0aa3befda88a0b9d9b43f1acbf07190c5cbe2e5db478721918803a787b7 -> rust-analyzer-20251124-funtoo-crates-bundle-516912830d0df325d2563587b5d452cbeb6710a14dc74e103e1617ce802f46c25a82196864748fdc1b96312682a9209f99c3b55761d3e9e61afbdd4b5abc3237.tar.gz"

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