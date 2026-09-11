# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/9074e9b4c6bc31d7986ccf4e22d18af70e5508da -> rust-analyzer-20260907-9074e9b.tar.gz
https://direct.funtoo.org/46/46/20/464620b46e5d71180569c84725f0e6a0d1b6ee43dbc3f9b6a34881d599c5e7ec467dc52219b838dacd2ffd316f39eeff085f6a9b4edb58c00a284d3cfc1896e0 -> rust-analyzer-20260907-funtoo-crates-bundle-170e475432769062415da27a0156954878d1a97fd5cf290050cb5dfea316558dc42303511d53303f731d84d58a66ffdbf6c6625a69dd3e771992275838ea20cd.tar.gz"

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