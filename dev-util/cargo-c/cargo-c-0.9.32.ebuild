# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/56dfe34ce1281f6ae5eb5517f7cf03f87bec352c -> cargo-c-0.9.32-56dfe34.tar.gz
https://direct.funtoo.org/71/ea/47/71ea476df17bd83d2e99d0e927b63ad0dc13a4b739a82fde9b0eef9d19897a8cf468c3b42cd5a58569bb1cd720d8d644b443c2951429d04c9d24e73e2ffab61b -> cargo-c-0.9.32-funtoo-crates-bundle-5c16e9de2191379a0e36e8587f7b87e95f8e831de4247d45d746f95620951e5c38d2b7181a37e5ee150e544e04d3a862abf1f8cdace6546bac3b2b4a1daa76df.tar.gz"

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