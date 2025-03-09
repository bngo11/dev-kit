# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Cross-platform Rust rewrite of the GNU coreutils"
HOMEPAGE="https://github.com/uutils/coreutils https://uutils.github.io/coreutils/docs/"
SRC_URI="https://github.com/uutils/coreutils/tarball/c8e892664627eb00b086758da8423be23f537338 -> coreutils-0.0.30-c8e8926.tar.gz
https://direct.funtoo.org/16/cc/16/16cc16f1c5527e569a0816872b55a88c09cb7b4c59fdcbbef58af087b20b3d0feff3ffb61fe245cc7f755b528a6af267a6c294a7e87b3baacc5ca765df691626 -> uutils-coreutils-0.0.30-funtoo-crates-bundle-0e45bfec8bab1647d2896bfd1dabd147a6e47cd330eecd5a6b26f9c5819ae15272e65a7ebd544a1e8e26f0d0fb1f0d67c0ecdc4cdd2fd914f7cff565fa493feb.tar.gz"

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