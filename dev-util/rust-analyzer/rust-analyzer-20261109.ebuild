# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/e5e7830640558e323e89c831488a3172b58dc66d -> rust-analyzer-20261109-e5e7830.tar.gz
https://direct.funtoo.org/fe/f3/56/fef356fe8606b79e6f2821a756f31568b3a358b8d29d742d45bdc7dbef804ff12d4407856832c1258832fcf3d8a88a8c91840b9822866ee98d662f3e47cca395 -> rust-analyzer-20261109-funtoo-crates-bundle-91906f96b1850eee06a2912c9c610bec622c64155505d7005703351c2ea4c1dbd8fc04a1c47f652de010c1952970fae0a42d1f9b42ee8f990bf5e19727d30192.tar.gz"

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