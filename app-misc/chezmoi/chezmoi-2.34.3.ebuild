# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

EGO_SUM=(
)

go-module_set_globals

DESCRIPTION="Manage your dotfiles across multiple diverse machines, securely."
HOMEPAGE="https://github.com/twpayne/chezmoi"
SRC_URI="https://github.com/twpayne/chezmoi/tarball/439ccf8f4f092a3b1f909e430775db933dc7c740 -> chezmoi-2.34.3-439ccf8.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=">=dev-vcs/git-1.7.3"
BDEPEND=">=dev-lang/go-1.17"

post_src_unpack() {
	mv ${WORKDIR}/twpayne-chezmoi-* ${S} || die
}

src_compile() {
	go build -o bin/chezmoi || die "compile failed"
}

src_install() {
	dobin bin/chezmoi
	dodoc README.md
}