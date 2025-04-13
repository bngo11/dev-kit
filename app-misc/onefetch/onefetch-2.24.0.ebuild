# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Command-line Git information tool"
HOMEPAGE="https://github.com/o2sh/onefetch"
SRC_URI="https://github.com/o2sh/onefetch/tarball/23cb2189e8d15a1851bec65a66db9f498fd23e2f -> onefetch-2.24.0-23cb218.tar.gz
https://direct.funtoo.org/8d/cc/78/8dcc78c2cfe93a829d8bcadacac2d2ff984cb9a27324c1caf1561e5131fe1f58548b17087d9ea146f388b6e7743a0f5ae5f8d3ffd5518f3d82b89fcdaa1c273d -> onefetch-2.24.0-funtoo-crates-bundle-57255396c18acf9cd3cbe8d319e7249b9bc5b0e774a912ba550f256af1bad842db8e7d78a48bd34589273f1b4d5f8cd09d75b7f511b899c1dfeed0c5884abf8b.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/onefetch"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/o2sh-onefetch-* ${S} || die
}