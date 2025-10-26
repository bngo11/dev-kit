# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Cross-platform Rust rewrite of the GNU coreutils"
HOMEPAGE="https://github.com/uutils/coreutils https://uutils.github.io/coreutils/docs/"
SRC_URI="https://github.com/uutils/coreutils/tarball/0a569a5d2bdb2b8166b9a2f2db608bd9e55ba208 -> coreutils-0.3.0-0a569a5.tar.gz
https://direct.funtoo.org/d1/d8/40/d1d840e9c07d1fcbedaa48b2e1c9b96a649e463bfdd425c3be423e0280a479deb394043dfe569ca36e5bf9f5fc9793ce3870f13764c6902fccc3a185dd02ec8b -> uutils-coreutils-0.3.0-funtoo-crates-bundle-57f0fe7dc13bc8e02c2554c54e6664884565b553626ae29cdfeb779b4ce70876275ae417e7cb82a5507e208322aac87b98460d7c778285ca918b8592372c0eea.tar.gz"

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