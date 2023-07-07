# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

EGO_SUM=(
)

go-module_set_globals

SRC_URI="https://github.com/jesseduffield/lazygit/tarball/5149b24ab3dfad3860e2300519c7c583dcc8c9ff -> lazygit-0.38.2-5149b24.tar.gz"

DESCRIPTION="A simple terminal UI for git commands"
HOMEPAGE="http://github.com/jesseduffield/lazygit"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
IUSE=""

post_src_unpack() {
	mv "${WORKDIR}"/jesseduffield-lazygit-* "${S}" || die
}

src_compile() {
	go build -mod=mod . || die "compile failed"
}

src_install() {
	dobin ${PN}
	dodoc README.md
}