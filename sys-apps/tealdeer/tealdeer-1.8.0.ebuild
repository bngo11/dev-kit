# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo bash-completion-r1

DESCRIPTION="A very fast implementation of tldr in Rust."
HOMEPAGE="https://github.com/dbrgn/tealdeer https://dbrgn.github.io/tealdeer/"
SRC_URI="https://github.com/dbrgn/tealdeer/tarball/bbd2a8d703c1074c3671578b5dfd5795dbd57279 -> tealdeer-1.8.0-bbd2a8d.tar.gz
https://direct.funtoo.org/59/6e/c8/596ec8f12a58473a94162bbc61bc4d4d928fe66d232a8b2ad937f62fe44fa5011c0435e34a89722023e26c9f3e308ac7836fa6db5cc99996dca1c5bf7e8c8b54 -> tealdeer-1.8.0-funtoo-crates-bundle-71872869dbfe7ab828057cccca4f1f23ff30ee4eaaeb1a6643f0e883f162f9421280b9f558b1eaa51d38b1c32cfebf2400845b531cb0650196e3d8def98112f9.tar.gz"

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