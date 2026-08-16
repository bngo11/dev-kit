# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/f938641be53c2e4bacd7dc46bddb74825a3e9d28 -> rust-analyzer-20260810.1-f938641.tar.gz
https://direct.funtoo.org/9d/0f/26/9d0f262637f81b7d10c6d62b48b49766f789c59fd4aae34d4ac4451a0b2ca44b0bd6464604f68f7b47c1ab789d266e6b7cd4b7f7e9b89e975a8ba3d725cfb9a0 -> rust-analyzer-20260810.1-funtoo-crates-bundle-134e421a26909e244df69bad68c987e81bc00f5050f16ee5385783abd4405956a34d13cd3d1102d57eae3e1b5188a2c78e4dee5579fde0f426e46df02eadad3a.tar.gz"

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