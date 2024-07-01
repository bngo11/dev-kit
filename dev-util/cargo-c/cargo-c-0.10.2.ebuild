# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/3a2b7cfc1e9eb4fb9054d23dd816b59d10a2f49e -> cargo-c-0.10.2-3a2b7cf.tar.gz
https://direct.funtoo.org/55/54/5b/55545b2f1caa88bcc8a8b0bb2162ca6f5cd5314eb886afdb850549847bab45ce99a97762357f3aa0aec314fe247bd32ee81af98240f97bd04f8c6bc806558194 -> cargo-c-0.10.2-funtoo-crates-bundle-6f86d803d485c1a457b7b3ea565b4e666fb1dc31047e4383c36ac50156ee2ba662b5dc9fe8bef671139e89125427c647454f292100fa0a845cf5496936907d5a.tar.gz"

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