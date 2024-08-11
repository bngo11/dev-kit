# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://direct.funtoo.org/d7/bd/72/d7bd7230260435566f18052fb8143fe6524c55b4c6dc9b8ccfd98d9e5c217ae938d5957ce5896438ed205b548c73ca106a60c2d3d5cfedc5ac111f42dd9cd888 -> cargo-c-0.10.3-funtoo-crates-bundle-588d3c884fdef160c6f4878ee10e155822d4ef3d56a0a8f1f41da7737ffc068f73048a0faf18010e18167e5b0b91f7f93509521fb64d771993c120554a299cd0.tar.gz"

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