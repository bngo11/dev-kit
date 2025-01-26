# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://direct.funtoo.org/ff/b8/42/ffb842b4ef4e12ab50f7b1f798ffb692afc9758e251bf2703f4bd8a3350810133ed7f279ebebad5612ee6297dd83d19a85598c39bb30f8f1b4dbdfa59d48a757 -> cargo-c-0.10.9-funtoo-crates-bundle-0e1427d98922f824713f65a8018af9a1949cbb483075b04ca548efc1ed319963602cf0a52ba748806c5320ce8a6e87a1abaa94734e2aac3c7a266fcbe12babf5.tar.gz"

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