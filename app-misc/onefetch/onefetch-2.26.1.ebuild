# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Command-line Git information tool"
HOMEPAGE="https://github.com/o2sh/onefetch"
SRC_URI="https://github.com/o2sh/onefetch/tarball/7c0446ce7100e3363b8b704f28afa2b07c4a8288 -> onefetch-2.26.1-7c0446c.tar.gz
https://direct.funtoo.org/94/cf/cc/94cfccd98a45fc944ce976b2393b3e059042a205ea32a5a5e2d31a809ea30cadfcc10a526734679a0e2801d21c3c84ed9beb5b4eb2b0842bffc222d90734c009 -> onefetch-2.26.1-funtoo-crates-bundle-2ffdb7390583b81b54e9428e2103320af58a3279e8ba9ba10b2ef633bc14600eeb76cb7fb809c25f0e39a6b80b3751d013dda903960e2968607192cb958fe1db.tar.gz"

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