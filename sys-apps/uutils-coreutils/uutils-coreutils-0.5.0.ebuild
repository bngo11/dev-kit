# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Cross-platform Rust rewrite of the GNU coreutils"
HOMEPAGE="https://github.com/uutils/coreutils https://uutils.github.io/coreutils/docs/"
SRC_URI="https://github.com/uutils/coreutils/tarball/14c67c690a82dea76899bffa45112db00857f3e7 -> coreutils-0.5.0-14c67c6.tar.gz
https://direct.funtoo.org/45/99/87/45998736ede44b6355e652932b5e5a760dab51db5dd03b72dda412588ae79774ad4aa18bed5a69a33c3ded3ab4d62785f1426b45430ff817e85053c7f955f4ec -> uutils-coreutils-0.5.0-funtoo-crates-bundle-88f2a6879898b15b33280859e7ad855271ffba52bdd30a5bf1fedcf592cd4714b1a02236b0572d88a4d12fc8bcec090bae80462987916d609fb5ef2f31f37b7e.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

DOCS=( README.md )

QA_FLAGS_IGNORED="/usr/bin/coreutils"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/uutils-coreutils-* ${S} || die
}

src_configure() {
	cargo_src_configure --features unix
}

src_install() {
	cargo_src_install
	einstalldocs
}