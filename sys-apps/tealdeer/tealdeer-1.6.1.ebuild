# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo bash-completion-r1

DESCRIPTION="A very fast implementation of tldr in Rust."
HOMEPAGE="https://github.com/dbrgn/tealdeer https://dbrgn.github.io/tealdeer/"
SRC_URI="https://github.com/dbrgn/tealdeer/tarball/412950316b82fbd12d1569cc75badd6fe5c77574 -> tealdeer-1.6.1-4129503.tar.gz
https://direct.funtoo.org/ff/1a/22/ff1a22b6ce55c437151c967a7476e03f8660096ebb3cf8df665318dd2ca39a7221a9ab9230db8d4ded335ac638bac0c13c87ae4d6d75c53c89f8bfc90756fae1 -> tealdeer-1.6.1-funtoo-crates-bundle-9991adc9de3be8c6ff4991e480ff3724a3766e14a73a6e29b6cac72051e7a5fe73873559268989877c72a2e81d1ff0e2fd40a48c01e0d91cdd6bcb16a9bb9629.tar.gz"

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