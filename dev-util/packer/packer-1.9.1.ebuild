# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

EGO_SUM=(
)

go-module_set_globals

DESCRIPTION="A tool for creating identical machine images for multiple platforms"
HOMEPAGE="https://www.packer.io/ https://github.com/hashicorp/packer"
SRC_URI="https://github.com/hashicorp/packer/tarball/7845f3a02c751bc57104673617ada596933c9a08 -> packer-1.9.1-7845f3a.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.17"
S="${WORKDIR}/hashicorp-packer-7845f3a"

src_compile() {
	go build -o "${PN}" || die "compile failed"
}

src_install() {
	dobin ${PN}/${PN}
	dodoc README.md
}