# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 go-module

go-module_set_globals

SRC_URI="https://github.com/kubernetes-sigs/cri-tools/tarball/88d8ad9d40f82726fda53c2d271e6172b4c619c9 -> cri-tools-1.36.0-88d8ad9.tar.gz
https://direct.funtoo.org/65/eb/3f/65eb3f7990ab96fcaaf9acec3cc7207c10d7737cf9abf38578dc564fdfba521d76d7d4480733a902f49ea270bc58a813f0044b763c00d423fd45d02f6ccb6e8b -> cri-tools-1.36.0-funtoo-go-bundle-3816107328712e17e1ddaa7d9e5288e64b3bdabecd3ee628fe55f59ca21338103589e401b7ff0674c8c4a105e5387c458d92cffa8080e0373849db06a96a908c.tar.gz"

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