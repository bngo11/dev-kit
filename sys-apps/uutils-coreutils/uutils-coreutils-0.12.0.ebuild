# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Cross-platform Rust rewrite of the GNU coreutils"
HOMEPAGE="https://github.com/uutils/coreutils https://uutils.github.io/coreutils/docs/"
SRC_URI="https://github.com/uutils/coreutils/tarball/5ab52189443867d56e8beb8984f52efd18fd7682 -> coreutils-0.12.0-5ab5218.tar.gz
https://direct.funtoo.org/7c/a4/7e/7ca47e8bb3b5744bfae1c13f7950969e76d79b71d206c7c6e8ed93954412778c3b5db375817c13bb3dec18c186004cfcb1fe957bd71e6eea5b186e15bddd8560 -> uutils-coreutils-0.12.0-funtoo-crates-bundle-f166c60860a3bb916b7f7a34c2612d0e7c075beaa2384803456316adc37509f8d5374eb0322124438a279e3bdcf3284186d99834e27219efda25a76b305fb7f0.tar.gz"

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