# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

EGO_SUM=(
	"github.com/agnivade/levenshtein v1.2.2-0.20250519083737-420867539855"
	"github.com/agnivade/levenshtein v1.2.2-0.20250519083737-420867539855/go.mod"
	"github.com/arbovm/levenshtein v0.0.0-20160628152529-48b4e1c0c4d0"
	"github.com/arbovm/levenshtein v0.0.0-20160628152529-48b4e1c0c4d0/go.mod"
	"github.com/boyter/gocodewalker v1.5.1"
	"github.com/boyter/gocodewalker v1.5.1/go.mod"
	"github.com/boyter/simplecache v0.0.0-20250113230110-8a4c9201822a"
	"github.com/boyter/simplecache v0.0.0-20250113230110-8a4c9201822a/go.mod"
	"github.com/clipperhouse/uax29/v2 v2.2.0"
	"github.com/clipperhouse/uax29/v2 v2.2.0/go.mod"
	"github.com/coreos/go-systemd/v22 v22.5.0/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.6/go.mod"
	"github.com/danwakefield/fnmatch v0.0.0-20160403171240-cbb64ac3d964"
	"github.com/danwakefield/fnmatch v0.0.0-20160403171240-cbb64ac3d964/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dgryski/trifles v0.0.0-20230903005119-f50d829f2e54"
	"github.com/dgryski/trifles v0.0.0-20230903005119-f50d829f2e54/go.mod"
	"github.com/godbus/dbus/v5 v5.0.4/go.mod"
	"github.com/google/gofuzz v1.0.0/go.mod"
	"github.com/inconshreveable/mousetrap v1.1.0"
	"github.com/inconshreveable/mousetrap v1.1.0/go.mod"
	"github.com/json-iterator/go v1.1.12"
	"github.com/json-iterator/go v1.1.12/go.mod"
	"github.com/mattn/go-colorable v0.1.12/go.mod"
	"github.com/mattn/go-colorable v0.1.13"
	"github.com/mattn/go-colorable v0.1.13/go.mod"
	"github.com/mattn/go-isatty v0.0.14/go.mod"
	"github.com/mattn/go-isatty v0.0.16/go.mod"
	"github.com/mattn/go-isatty v0.0.19"
	"github.com/mattn/go-isatty v0.0.19/go.mod"
	"github.com/mattn/go-runewidth v0.0.19"
	"github.com/mattn/go-runewidth v0.0.19/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180228061459-e0a39a4cb421/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd"
	"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd/go.mod"
	"github.com/modern-go/reflect2 v1.0.2"
	"github.com/modern-go/reflect2 v1.0.2/go.mod"
	"github.com/pkg/errors v0.9.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/rs/xid v1.5.0/go.mod"
	"github.com/rs/zerolog v1.30.0"
	"github.com/rs/zerolog v1.30.0/go.mod"
	"github.com/russross/blackfriday/v2 v2.1.0/go.mod"
	"github.com/spf13/cobra v1.10.1"
	"github.com/spf13/cobra v1.10.1/go.mod"
	"github.com/spf13/pflag v1.0.9/go.mod"
	"github.com/spf13/pflag v1.0.10"
	"github.com/spf13/pflag v1.0.10/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.10.0"
	"github.com/stretchr/testify v1.10.0/go.mod"
	"golang.org/x/crypto v0.43.0"
	"golang.org/x/crypto v0.43.0/go.mod"
	"golang.org/x/sync v0.17.0"
	"golang.org/x/sync v0.17.0/go.mod"
	"golang.org/x/sys v0.0.0-20210630005230-0f9fa26af87c/go.mod"
	"golang.org/x/sys v0.0.0-20210927094055-39ccf1dd6fa6/go.mod"
	"golang.org/x/sys v0.0.0-20220811171246-fbc7d0a398ab/go.mod"
	"golang.org/x/sys v0.6.0/go.mod"
	"golang.org/x/sys v0.37.0"
	"golang.org/x/sys v0.37.0/go.mod"
	"golang.org/x/text v0.30.0"
	"golang.org/x/text v0.30.0/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/yaml.v2 v2.4.0"
	"gopkg.in/yaml.v2 v2.4.0/go.mod"
	"gopkg.in/yaml.v3 v3.0.1"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
)

go-module_set_globals

SRC_URI="https://github.com/boyter/scc/tarball/8b97011a57811dd815354ade0e98d360cf6580c8 -> scc-3.6.0-8b97011.tar.gz
https://direct.funtoo.org/e6/3f/44/e63f447f5faba21766f50ea12332a61c5ea7fb05c281c9e031e814cf78f62102df72b2a89df82da62d5f7aef4bedf6375e77d009cf6ee2031c8c8a6ba0c168a7 -> scc-3.6.0-funtoo-go-bundle-e0e08fbe35b94b4f19e2d3ad2e925152b6295b828e009550a53d4be3b75adcece58f8b0b4a8d5048acafaf48331de0560194763656f7e461ded7e15795df52fd.tar.gz"

DESCRIPTION="A tool similar to cloc, sloccount and tokei"
HOMEPAGE="https://github.com/boyter/scc"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""

post_src_unpack() {
	mv ${WORKDIR}/boyter-* ${S} || die
}

src_compile() {
	go build -mod=mod . || die "compile failed"
}

src_install() {
	dobin ${PN}
	dodoc README.md
}