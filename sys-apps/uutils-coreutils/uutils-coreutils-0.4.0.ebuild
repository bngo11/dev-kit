# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Cross-platform Rust rewrite of the GNU coreutils"
HOMEPAGE="https://github.com/uutils/coreutils https://uutils.github.io/coreutils/docs/"
SRC_URI="https://github.com/uutils/coreutils/tarball/4952b9c5dabb0b4673e5b4f83cb86251977dfa70 -> coreutils-0.4.0-4952b9c.tar.gz
https://direct.funtoo.org/3a/7c/df/3a7cdff8efc2ffff898d54aaf18770c6ffa21c309d8e7c6d302588be2643c17d1953862068b1eeb4b3e3eeccabf1e0a4cb6521c087702ec9f9d3879f8766bfe7 -> uutils-coreutils-0.4.0-funtoo-crates-bundle-bd05f5aaa36c1015f4324593b80356ee602397e7d72d3d2db307db78d0df4b89c82b162ba8f479b7c32eb035b3dad681643eea2e77eec74c5284ae3730ff69b3.tar.gz"

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