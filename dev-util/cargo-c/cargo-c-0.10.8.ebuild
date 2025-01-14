# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/0d90bc5a47f2c37187545fe65efe37cc2f2647d7 -> cargo-c-0.10.8-0d90bc5.tar.gz
https://direct.funtoo.org/37/57/e9/3757e9cf2633a441e0b603b6205234837ff4ec2cec2493ff8d6e051fc9669d150a6234bcc4b1296d28e0eaa71c06515b6cae5a535109b420d093c2b4eae18e9a -> cargo-c-0.10.8-funtoo-crates-bundle-716b8c224386d5d2fe745589609c52e25b4ea756d450cb10ab7935a6601dc73a98bfd90cfcba7ef3d999602beb8dea2e94bdd45d88fdfd7340b9f37e67eb03d4.tar.gz"

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