# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://direct.funtoo.org/94/36/d5/9436d5099d17b6e32c8bd5630884c54f8916e8320804c3366a2176f169bc0d0114af3452b14e0c9d7bca730a3db32958e32fad6aec5d0ee1f40cab0c52e26893 -> cargo-c-0.10.5-funtoo-crates-bundle-853a9377aa0a51c728b93fd6b08d2e318b574ed0734be8184e4a3697480f725c4315b6f5b683ce028d57c65e54b78a8107c329b68e098d82850f0eb8df0bebf9.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="sys-libs/zlib
	dev-libs/openssl:0=
	dev-vcs/git
	net-misc/curl[ssl]
"
BDEPEND="virtual/rust"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/lu-zero-cargo-c-* ${S} || die
}