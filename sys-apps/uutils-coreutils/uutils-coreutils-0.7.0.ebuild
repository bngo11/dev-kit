# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Cross-platform Rust rewrite of the GNU coreutils"
HOMEPAGE="https://github.com/uutils/coreutils https://uutils.github.io/coreutils/docs/"
SRC_URI="https://github.com/uutils/coreutils/tarball/55dd596c9077bb887346f7e02f673e4e39ed48af -> coreutils-0.7.0-55dd596.tar.gz
https://direct.funtoo.org/93/bf/02/93bf024181b1a0ef05b60f9960e6e121c531f63e2330d623c626c52fddb46df53086a13620991e7573b47e86b0956b90539438da9c51fce3eab85775b25b095f -> uutils-coreutils-0.7.0-funtoo-crates-bundle-efce7649695f3c377449e41fb66fa8172db3f3734104db5891de94045ef8bb7beab6721a872c0157606c313d83d044b5b564e7997835f06a3249577fda7c84be.tar.gz"

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