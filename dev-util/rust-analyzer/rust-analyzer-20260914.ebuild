# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/682a84e95b5a52cf06e9822fcaa4f628738554bf -> rust-analyzer-20260914-682a84e.tar.gz
https://direct.funtoo.org/99/52/62/9952623b594ebf65d7d431ce56aaf28aaf42bfd3ba69fa93c29737fad258e612e0bb1169d44916253933cdd35f39bd0d999f7c650074a41882cd86dcfc78b705 -> rust-analyzer-20260914-funtoo-crates-bundle-170e475432769062415da27a0156954878d1a97fd5cf290050cb5dfea316558dc42303511d53303f731d84d58a66ffdbf6c6625a69dd3e771992275838ea20cd.tar.gz"

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