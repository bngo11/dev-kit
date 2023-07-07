# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 go-module

EGO_SUM=(
)

go-module_set_globals

DESCRIPTION="Command-line wrapper for git that makes you better at GitHub"
HOMEPAGE="https://github.com/github/hub"
SRC_URI="https://github.com/github/hub/tarball/a1b6bb179a1311738c48a364cde44253c7459a86 -> hub-2.14.2-a1b6bb1.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

BDEPEND="sys-apps/groff"
RDEPEND=">=dev-vcs/git-1.7.3"

post_src_unpack() {
	mv "${WORKDIR}"/github-hub-* "${S}" || die
}

src_compile() {
	go build -mod=mod . || die "compile failed"
	emake bin/hub man-pages
}

src_test() {
	emake test
}

src_install() {
	dobin ${PN}
	dodoc README.md
	doman share/man/man1/*.1

	newbashcomp etc/${PN}.bash_completion.sh ${PN}

	insinto /usr/share/vim/vimfiles
	doins -r share/vim/vimfiles/*
	insinto /usr/share/zsh/site-functions
	newins etc/hub.zsh_completion _${PN}
}