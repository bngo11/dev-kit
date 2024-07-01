# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 cargo

DESCRIPTION="A more intuitive version of du in rust"
HOMEPAGE="https://github.com/bootandy/dust"
SRC_URI="https://github.com/bootandy/dust/tarball/082f15a0e2a5e8a573a2a42a65f146e755b982ed -> dust-1.0.0-082f15a.tar.gz
https://direct.funtoo.org/62/1a/29/621a29c274eea6b559fcf9bf592242c780526afc637f213e8d0ef630fe7812ad9fe6b7f2a31e1364d7ab406bf31f71fc7ce998ace2c7010cafdc7a2d9e12ae69 -> dust-1.0.0-funtoo-crates-bundle-7179d75c0469a030286fcad3918d3276f677c6e16fe591941423a2f2c6dff792865a6e967ecc4969f08410ddd9210ef23a70cbebc5f9d2266a93d7b7b6752eb8.tar.gz"

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