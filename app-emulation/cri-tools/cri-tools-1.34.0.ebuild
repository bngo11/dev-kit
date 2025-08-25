# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 go-module

go-module_set_globals

SRC_URI="https://github.com/kubernetes-sigs/cri-tools/tarball/ca0237b9fec5b675b0bb7bc96b7496e6d54f5ccb -> cri-tools-1.34.0-ca0237b.tar.gz
https://direct.funtoo.org/2f/ec/b4/2fecb4b8e0dc43a26c32a4004a12935f83d9132e656344bfdf3f5ccae178be6d3753f3b6ff86e6c576698554c9038a6d4f9b195c89292679604cf0d3f2d82fa1 -> cri-tools-1.34.0-funtoo-go-bundle-d4be9ba96481c41cf6690099bff08150f1f00aeeb2a745db635814d38c56d7fe05553a328579cd4906e9c15e318e75daf98f2c2dace1e6c4f372a27877af7ab6.tar.gz"

DESCRIPTION="CLI and validation tools for Kubelet Container Runtime (CRI)"
HOMEPAGE="https://github.com/kubernetes-sigs/cri-tools"

LICENSE="Apache-2.0 BSD BSD-2 CC-BY-SA-4.0 ISC MIT MPL-2.0"
SLOT="0"
KEYWORDS="*"

DEPEND="dev-lang/go"

RESTRICT+=" test"

src_unpack() {
	go-module_src_unpack
	if [ ! -d "${S}" ]; then
		mv kubernetes-sigs-cri-tools* "${S}" || die
	fi
}

src_compile() {
	emake VERSION="${PV}"
	./build/bin/linux/amd64/crictl completion bash > "${PN}.bash" || die
	./build/bin/linux/amd64/crictl completion zsh > "${PN}.zsh" || die
}

src_install() {
	dobin ./build/bin/linux/amd64/crictl

	newbashcomp ${PN}.bash ${PN}
	insinto /usr/share/zsh/site-functions
	newins ${PN}.zsh _${PN}

	dodoc -r docs {README,RELEASE,CHANGELOG,CONTRIBUTING}.md
}