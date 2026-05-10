# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/f04c37286472e3687a2d32d3d1fad2772de515a1 -> rust-analyzer-20260504-f04c372.tar.gz
https://direct.funtoo.org/5f/68/4c/5f684cf7ca098acb1c4312ee1ec5b9970ac898481480a500441580f5c001b9585f3334fbb829f488ee64a0e0edf3f873762b709eabc8378985556d1e3878661c -> rust-analyzer-20260504-funtoo-crates-bundle-5ba6d3535e40834d81964d920f7096d9db8fba36e5db735d7b80ff4ef1d816c74fc0ca77959da2fa35a411b5bc594be6de27f9a377f27bfe80b320c47923a18c.tar.gz"

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