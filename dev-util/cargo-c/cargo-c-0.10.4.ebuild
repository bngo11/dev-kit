# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://direct.funtoo.org/af/01/b2/af01b28acbef5ca4de40871b9500078bcce8b3b37a918e7d6ebc9f66f61135c4f328a96cb1e86b1d62920e4e1455cf4511e353792e1f52c81e297be586f99c25 -> cargo-c-0.10.4-funtoo-crates-bundle-2dad42903ec1104ae07d85dddd51bf620693fa9543cce0fe318c70e8830a1ac13ee6611675a38f97f0daa8cab273e3c561ea32a4e3234ffd2b2d561454848438.tar.gz"

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