# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/b98172d80f0da12bbde3d6733c274e17cb6417aa -> rust-analyzer-20261102-b98172d.tar.gz
https://direct.funtoo.org/aa/e2/4d/aae24d105f5325e6304fa0af55c5b75a32c3f2fec0f8788deb0c4aeb3a19cfbfa17b75d21c7116f14e19ece0257119cd45f7d0db1404b47fbaba65ef621faaef -> rust-analyzer-20261102-funtoo-crates-bundle-9c38467a5a18a4214eeed69019ff668d770ef89285d3d55895d381b7616ebee552fa1a7fcbe2fb2a2cab6a30f71109325006d38deaec8ce8b58851121ee8aa8a.tar.gz"

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