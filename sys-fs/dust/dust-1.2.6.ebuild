# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 cargo

DESCRIPTION="A more intuitive version of du in rust"
HOMEPAGE="https://github.com/bootandy/dust"
SRC_URI="https://github.com/bootandy/dust/tarball/5cc5828d3b6b1c70c8ed6b952fda127639da4d7b -> dust-1.2.6-5cc5828.tar.gz
https://direct.funtoo.org/b2/db/6b/b2db6b29d5118df1ef0465d71b6e4822d7a0c879ca26be7960c7edfa813c6aef84b2be82c3d39c450656c17404c10ef190c3e5c8eeaba34218b7c7c0420a7392 -> dust-1.2.6-funtoo-crates-bundle-d85eeb60214ea80ddbf3c93d6abd72acfc2362755d76c50c066fcea9ee178981abc6e9d835db84f5838b8d18591dba9cb923fbb963254362037d2a914b569e99.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

DOCS=( README.md )

QA_FLAGS_IGNORED="/usr/bin/dust"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/bootandy-dust-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs

	doman man-page/dust.1

	newbashcomp completions/dust.bash dust

	insinto /usr/share/fish/vendor_completions.d/
	doins completions/dust.fish
}