# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 go-module

go-module_set_globals

SRC_URI="https://github.com/kubernetes-sigs/cri-tools/tarball/b633b386d6ec2c5743999a56c7df332b43759f9a -> cri-tools-1.30.1-b633b38.tar.gz
https://direct.funtoo.org/2a/7d/6d/2a7d6dbbbf5e51b669b654d191ef68b807e6be9f736041e4e2623b80342f4388ab2a6f54bf92821f97b6b0c7dd3a14c5c04c7de25fe4f0c7f9d18f2a1daf56a8 -> cri-tools-1.30.1-funtoo-go-bundle-5f22a834c9d8fccc6b8b93a17ab431df221d08836dd5a001c3f45d92a2f715195bf963128904f799d2b0fae47ad9c2aa03880f504f4fb93c8c47fe3d9bc0cef0.tar.gz"

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