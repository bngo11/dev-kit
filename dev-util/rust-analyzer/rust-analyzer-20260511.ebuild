# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/e266f5cab8f6525d0bc2ddccc0006418c534b5e6 -> rust-analyzer-20260511-e266f5c.tar.gz
https://direct.funtoo.org/03/a5/80/03a580bf82b05cdefbd2ef80df5f64483457e16227cbea6ba78a2a3fa37b95419e1c6740f03d8e854e1553ff68c3369a2e3c2ae06268e835a6aca5fb00171682 -> rust-analyzer-20260511-funtoo-crates-bundle-01ebebe5f7132f1e526440895057641fe2d8767bbe1df5e071c944e6371f39a3b6b70f2b0212be4c66dcf14f6df739cc4d4deb62fee77a4798709486d2f772ca.tar.gz"

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