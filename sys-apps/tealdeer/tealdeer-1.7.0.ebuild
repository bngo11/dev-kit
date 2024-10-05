# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo bash-completion-r1

DESCRIPTION="A very fast implementation of tldr in Rust."
HOMEPAGE="https://github.com/dbrgn/tealdeer https://dbrgn.github.io/tealdeer/"
SRC_URI="https://github.com/dbrgn/tealdeer/tarball/6b2f31ce347d9be2f17286d60d7424fcfbbcae32 -> tealdeer-1.7.0-6b2f31c.tar.gz
https://direct.funtoo.org/9b/a0/e6/9ba0e655d1716a03623ebb8cb87cdbe41c46b945df5bb0bd60f03807d3d45d743716b9be2ca5b2648952fd38bdc12ef6d125bda979fc1f8740b446cc1b0a8945 -> tealdeer-1.7.0-funtoo-crates-bundle-dcab52f1055a4bd8acf8b5410db9c1e3b2ec9c5c2eff98220446f57aeb3573b18dc90eedb23a162c1877752ca4bf653ad109217884015b25415f87c4306ee747.tar.gz"

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