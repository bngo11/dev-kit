# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo bash-completion-r1

DESCRIPTION="A very fast implementation of tldr in Rust."
HOMEPAGE="https://github.com/dbrgn/tealdeer https://dbrgn.github.io/tealdeer/"
SRC_URI="https://github.com/dbrgn/tealdeer/tarball/a11a91d45875742d39a81d7efcc36512cfee28ba -> tealdeer-1.8.1-a11a91d.tar.gz
https://direct.funtoo.org/e6/9e/c0/e69ec04d2dad9510d06180762ba2d5e04d36b0649394a6e39f7999a48619aa9427cef3bc7fa2062b80285d74f86a87113960c54c04d7f7b5c4ede218d56c9e1d -> tealdeer-1.8.1-funtoo-crates-bundle-6832a59a8e8e2df9c94a922541b0d5037df2d53246e36a2accf797f74feeb9014e56a3c158ee58ddac6f3f4636dc10e4128a70b19ea6b0aab9ab6c802da64f33.tar.gz"

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