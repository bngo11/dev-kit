# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module linux-info

DESCRIPTION="System container image builder for LXC and LXD"
HOMEPAGE="https://linuxcontainers.org/distrobuilder/introduction/"

EGO_SUM=(
)

go-module_set_globals

SRC_URI="https://github.com/lxc/distrobuilder/tarball/ff0c6f52796fce915208147272f107fcd31490bd -> distrobuilder-2.1-ff0c6f5.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
S="${WORKDIR}/lxc-distrobuilder-ff0c6f5"

RDEPEND="
	dev-util/debootstrap
	app-crypt/gnupg
	sys-fs/squashfs-tools
	dev-vcs/git
	net-misc/rsync
"

CONFIG_CHECK="~OVERLAY_FS"

src_compile() {
	GOBIN="${S}/bin" go install ./... || die "compile failed"
}

src_install() {
	dobin bin/*
	dodoc -r doc/*
}