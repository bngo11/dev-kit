# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Cross-platform Rust rewrite of the GNU coreutils"
HOMEPAGE="https://github.com/uutils/coreutils https://uutils.github.io/coreutils/docs/"
SRC_URI="https://github.com/uutils/coreutils/tarball/6dff066e6fa4ad9b713ed7c34c7c198115dec6bf -> coreutils-0.0.26-6dff066.tar.gz
https://direct.funtoo.org/57/8d/7a/578d7a8c0609f2b8eb06db79dd06aecab538e65414531beef73415ecc94f86eb6a52c12a8c3ea373c69c836699e5515804fc8d7e6916c4fca17d04459c96a857 -> uutils-coreutils-0.0.26-funtoo-crates-bundle-873ff6f3f4f7cb7e5c4f7fe6a82650ad3131115f61fe78799f704880114afaafb782771f408d00aed42844691150c64d28f849d01fd1ee1f602d7eace8e53c4b.tar.gz"

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