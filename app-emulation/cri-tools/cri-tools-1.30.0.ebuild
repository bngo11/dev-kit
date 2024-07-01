# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 go-module

go-module_set_globals

SRC_URI="https://github.com/kubernetes-sigs/cri-tools/tarball/87adf58b79394b151413c2e0ccfdc7e6332460dc -> cri-tools-1.30.0-87adf58.tar.gz
https://direct.funtoo.org/57/ea/2c/57ea2cc85a42d7f7e09b8c54aa0b0502480b270a728d15a47ba8bb56595649bd99bcb1fd558401ef60554fd18416bda162c035157313bf1d2ad024419a4a1521 -> cri-tools-1.30.0-funtoo-go-bundle-5f22a834c9d8fccc6b8b93a17ab431df221d08836dd5a001c3f45d92a2f715195bf963128904f799d2b0fae47ad9c2aa03880f504f4fb93c8c47fe3d9bc0cef0.tar.gz"

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