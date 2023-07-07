# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 go-module

EGO_SUM=(
)

go-module_set_globals

DESCRIPTION="GitHub CLI"
HOMEPAGE="https://github.com/cli/cli"
SRC_URI="https://github.com/cli/cli/tarball/bf7db84ca8b795a38ee47b5e54a8109a917a55bf -> cli-2.31.0-bf7db84.tar.gz"
KEYWORDS="*"
LICENSE="MIT Apache-2.0 BSD BSD-2 MPL-2.0"
SLOT="0"
RDEPEND=">=dev-vcs/git-1.7.3"
RESTRICT+=" test "

post_src_unpack() {
	mv ${WORKDIR}/cli-cli-* ${S} || die
}

src_compile() {
	export GH_VERSION="v2.31.0"
	# Go LDFLAGS are not the same as GCC/Binutils LDFLAGS
	unset LDFLAGS
	# Once we set up cross compiling, this line will need to be adjusted
	# to compile for the target.
	# Everything else in this function happens on the host.
	emake

	einfo "Building man pages"
	emake manpages

	einfo "Building completions"
	go run ./cmd/gh completion -s bash > gh.bash-completion || die
	go run ./cmd/gh completion -s zsh > gh.zsh-completion || die
}

src_install() {
	dobin bin/gh
	dodoc README.md

	doman share/man/man?/gh*.?

	newbashcomp gh.bash-completion gh
	insinto /usr/share/zsh/site-functions
	newins gh.zsh-completion _gh
}
