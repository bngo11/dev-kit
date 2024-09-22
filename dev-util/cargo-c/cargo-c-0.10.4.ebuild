# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://direct.funtoo.org/ab/7c/18/ab7c18381a3073225a0b31ca7c3e137d70716ca6e612af578c8bf3d0641973c8a07e8f0ae51c8c74214f73cd772fef894525c844b7e6f4cb1fd9a0311adf91ab -> cargo-c-0.10.4-funtoo-crates-bundle-8445d96e1b3a1a8c2aee8f9a35597913cc88931f52f0d8c05a9aace7e7a743f1c3c22f066695dbe26a84d71511c86035300239da8bc591400e526db8c3b6fb00.tar.gz"

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