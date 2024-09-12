# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://direct.funtoo.org/0f/cc/a4/0fcca4ebbe368cf49849f33ad30f53dce705b0e37fc2d5fc0a2a4e32dbf8e1aa84edffd1e22b5ea54537d2e80e5641b5c48dbca9cb197e0b1bc94e8cffbc61a5 -> cargo-c-0.10.4-funtoo-crates-bundle-cf87c1168114b51350e4f76f884e9a3778fa6f6fa48a13e9eee7f321afdb37ad98045ef3d924af6307d0641431838c1691db7c38ee42b4e048151c11145eac9d.tar.gz"

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