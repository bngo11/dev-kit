# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

EGO_SUM=(
	"github.com/a8m/envsubst v1.4.2"
	"github.com/a8m/envsubst v1.4.2/go.mod"
	"github.com/alecthomas/assert/v2 v2.2.2"
	"github.com/alecthomas/participle/v2 v2.0.0"
	"github.com/alecthomas/participle/v2 v2.0.0/go.mod"
	"github.com/alecthomas/repr v0.2.0"
	"github.com/alecthomas/repr v0.2.0/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.2/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dimchansky/utfbom v1.1.1"
	"github.com/dimchansky/utfbom v1.1.1/go.mod"
	"github.com/elliotchance/orderedmap v1.5.0"
	"github.com/elliotchance/orderedmap v1.5.0/go.mod"
	"github.com/fatih/color v1.15.0"
	"github.com/fatih/color v1.15.0/go.mod"
	"github.com/goccy/go-json v0.10.2"
	"github.com/goccy/go-json v0.10.2/go.mod"
	"github.com/goccy/go-yaml v1.10.1"
	"github.com/goccy/go-yaml v1.10.1/go.mod"
	"github.com/hexops/gotextdiff v1.0.3"
	"github.com/inconshreveable/mousetrap v1.0.1"
	"github.com/inconshreveable/mousetrap v1.0.1/go.mod"
	"github.com/jinzhu/copier v0.3.5"
	"github.com/jinzhu/copier v0.3.5/go.mod"
	"github.com/magiconair/properties v1.8.7"
	"github.com/magiconair/properties v1.8.7/go.mod"
	"github.com/mattn/go-colorable v0.1.13"
	"github.com/mattn/go-colorable v0.1.13/go.mod"
	"github.com/mattn/go-isatty v0.0.16/go.mod"
	"github.com/mattn/go-isatty v0.0.17"
	"github.com/mattn/go-isatty v0.0.17/go.mod"
	"github.com/pelletier/go-toml/v2 v2.0.7"
	"github.com/pelletier/go-toml/v2 v2.0.7/go.mod"
	"github.com/pkg/diff v0.0.0-20210226163009-20ebb0f2a09e"
	"github.com/pkg/diff v0.0.0-20210226163009-20ebb0f2a09e/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/russross/blackfriday/v2 v2.1.0/go.mod"
	"github.com/spf13/cobra v1.6.1"
	"github.com/spf13/cobra v1.6.1/go.mod"
	"github.com/spf13/pflag v1.0.5"
	"github.com/spf13/pflag v1.0.5/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.4.0/go.mod"
	"github.com/stretchr/objx v0.5.0/go.mod"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/stretchr/testify v1.7.1/go.mod"
	"github.com/stretchr/testify v1.8.0/go.mod"
	"github.com/stretchr/testify v1.8.1"
	"github.com/stretchr/testify v1.8.1/go.mod"
	"golang.org/x/net v0.8.0"
	"golang.org/x/net v0.8.0/go.mod"
	"golang.org/x/sys v0.0.0-20220811171246-fbc7d0a398ab/go.mod"
	"golang.org/x/sys v0.6.0"
	"golang.org/x/sys v0.6.0/go.mod"
	"golang.org/x/text v0.8.0"
	"golang.org/x/text v0.8.0/go.mod"
	"golang.org/x/xerrors v0.0.0-20220609144429-65e65417b02f"
	"golang.org/x/xerrors v0.0.0-20220609144429-65e65417b02f/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/op/go-logging.v1 v1.0.0-20160211212156-b2cb9fa56473"
	"gopkg.in/op/go-logging.v1 v1.0.0-20160211212156-b2cb9fa56473/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.1"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
)

go-module_set_globals

DESCRIPTION="yq is a portable command-line YAML, JSON and XML processor"
HOMEPAGE="https://github.com/mikefarah/yq"
SRC_URI="https://github.com/mikefarah/yq/tarball/d5bbe5bea564beb9c7f30471e63d51cac95d1304 -> yq-4.33.2-d5bbe5b.tar.gz
https://direct.funtoo.org/a0/6e/25/a06e256680cfae6818e50406a7e6ffc086a0b38a9e8aae50c1114996d8b14dc9cc40346065a66e515c747176143bf722dd0e52958511723f3ffc472828cf50c2 -> yq-go-4.33.2-funtoo-go-bundle-5c7d326f9504a10338a9436d3646aaa3b4320f8fef73df0f5cd5bfbf453f1de7a5e914d614d516292fc7d82233e0b95d177ff33df42e2d6653f1a7bb014dcf2a.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"
S="${WORKDIR}/mikefarah-yq-d5bbe5b"

DEPEND=""
RDEPEND=">=dev-vcs/git-1.7.3"
BDEPEND=">=dev-lang/go-1.16.14"

src_compile() {
	# The default yq go binary will conflict with python-modules-kit's app-misc/yq, which also has a yq executable installed to /usr/bin/yq
	# For now until a decision is made regarding app-misc/yq, yq-go will be used as the binary name to avoid any collisions
	go build -o bin/yq-go || die "compile failed"
}

src_install() {
	dobin bin/yq-go
	dodoc README.md
}