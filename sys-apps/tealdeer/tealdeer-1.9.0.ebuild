# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo bash-completion-r1

DESCRIPTION="A very fast implementation of tldr in Rust."
HOMEPAGE="https://github.com/dbrgn/tealdeer https://dbrgn.github.io/tealdeer/"
SRC_URI="https://github.com/dbrgn/tealdeer/tarball/72b9b181ec7d6cba61751636c4fa6d44f4fa51d7 -> tealdeer-1.9.0-72b9b18.tar.gz
https://direct.funtoo.org/e4/f7/6b/e4f76b676ea096ec26ba4e6deba8855613714d9f9fe27d9e47b3aa72f27c09019ac5fed0a1f4926612042f62f6091e2b0bb7bc2d617f0ec9eb9016c4f359a368 -> tealdeer-1.9.0-funtoo-crates-bundle-d3caf779713addc7dea92b9da0fccb3df4ec319f56a4c22649c0a479db03a92906e7506d4f866d79cdf610cd37648affd630e15dc1ea8c39aced87dc9bd82812.tar.gz"

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