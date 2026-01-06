# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/6a1246b69ca761480b9278df019f717b549cface -> rust-analyzer-20260105-6a1246b.tar.gz
https://direct.funtoo.org/8e/5e/6a/8e5e6acbe6f65bfd373ebe23a1a35764ba63b0c3a534129c758abf6decbca50eb4fe13acb924ca0ad55f3e8c669c79f5026aa54df303dff23c4843f1148e65ba -> rust-analyzer-20260105-funtoo-crates-bundle-ea7ce95f1284dffa33054e22ee3f9a1b5633c8f05b0d8f723809b35ed841176d5ea2c927bb6d1bb75dd68e9f80435d43298fa867c55a4e4051141fb0bc622e2a.tar.gz"

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