# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo bash-completion-r1

DESCRIPTION="A very fast implementation of tldr in Rust."
HOMEPAGE="https://github.com/dbrgn/tealdeer https://dbrgn.github.io/tealdeer/"
SRC_URI="https://github.com/dbrgn/tealdeer/tarball/37a596907ee75d57620cb8783efd7c0b16ec5dd2 -> tealdeer-1.9.1-37a5969.tar.gz
https://direct.funtoo.org/25/18/28/251828297c53c0adfd85ca27a826f9a2ed5d26ee6400a7c3eee4d869c78c1bd8c3c7090e897aa0fead346ded12cfbc224703e36848efd3b1c1ee1e5a07b72edd -> tealdeer-1.9.1-funtoo-crates-bundle-3fb42a9a74b4cf6ac91554c8bd1330699e24f06ddc5b7d58610cb46bfc445690163d6fee529c9bf4ba73dddb02c7c71fcd6670558ba04b8b3e6b2064a0ec7b72.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="+bash-completion zsh-completion fish-completion"

DOCS=( README.md CHANGELOG.md )

QA_FLAGS_IGNORED="usr/bin/tldr"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/dbrgn-tealdeer-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs

	use bash-completion && newbashcomp completion/bash_tealdeer tldr

	use zsh-completion && {
		insinto /usr/share/zsh/site-functions
		newins completion/zsh_tealdeer _tldr
	}

	use fish-completion && {
		insinto /usr/share/fish/vendor_completions.d
		newins completion/fish_tealdeer tldr.fish
	}
}