# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/3a2b7cfc1e9eb4fb9054d23dd816b59d10a2f49e -> cargo-c-0.10.2-3a2b7cf.tar.gz
https://direct.funtoo.org/97/0a/b1/970ab1d3f6c59e592f2142e76ffa70223d475d9f3ab6f0a782ff32045a806a80507bcf2edfe2b56a3ea227ef08e914e11e2bfc88f6d459066fae7b02f884d50f -> cargo-c-0.10.2-funtoo-crates-bundle-2806afe4ba373f958e3f6c822ec54cc911390a742acb83107746dd202b139f067403d94c74431287195d8a932d1f57656085099aee4002a0d53a9d3c5302ff46.tar.gz"

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