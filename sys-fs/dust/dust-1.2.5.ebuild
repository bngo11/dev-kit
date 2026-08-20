# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 cargo

DESCRIPTION="A more intuitive version of du in rust"
HOMEPAGE="https://github.com/bootandy/dust"
SRC_URI="https://github.com/bootandy/dust/tarball/8a846f6689f2db6be6ef595239a21ec784d62b57 -> dust-1.2.5-8a846f6.tar.gz
https://direct.funtoo.org/1e/b6/a6/1eb6a684acb28d621de8d550e2b0a8030223dc74fb8bdcab25e6767434a7e2a3eddb20f00e8241f1540bd170a6c9df80b0061ae98d930760de6bce86cde0f99d -> dust-1.2.5-funtoo-crates-bundle-f86d3c6731df0b691609d2978a081ba558b19f754b87c6e4b7954099368a7d36eb411461a74f9ab64648ad1e5eaaafe1553ccba4c03ab43c2baed8ce6914dcb8.tar.gz"

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