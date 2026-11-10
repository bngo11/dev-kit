# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

EGO_SUM=(
	"github.com/a8m/envsubst v1.4.3"
	"github.com/a8m/envsubst v1.4.3/go.mod"
	"github.com/agext/levenshtein v1.2.1"
	"github.com/agext/levenshtein v1.2.1/go.mod"
	"github.com/alecthomas/assert/v2 v2.11.0"
	"github.com/alecthomas/assert/v2 v2.11.0/go.mod"
	"github.com/alecthomas/participle/v2 v2.1.4"
	"github.com/alecthomas/participle/v2 v2.1.4/go.mod"
	"github.com/alecthomas/repr v0.5.4"
	"github.com/alecthomas/repr v0.5.4/go.mod"
	"github.com/apparentlymart/go-textseg/v15 v15.0.0"
	"github.com/apparentlymart/go-textseg/v15 v15.0.0/go.mod"
	"github.com/apparentlymart/go-textseg/v17 v17.0.1"
	"github.com/apparentlymart/go-textseg/v17 v17.0.1/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.6/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dimchansky/utfbom v1.2.0"
	"github.com/dimchansky/utfbom v1.2.0/go.mod"
	"github.com/elliotchance/orderedmap v1.8.0"
	"github.com/elliotchance/orderedmap v1.8.0/go.mod"
	"github.com/fatih/color v1.19.0"
	"github.com/fatih/color v1.19.0/go.mod"
	"github.com/go-ini/ini v1.67.0"
	"github.com/go-ini/ini v1.67.0/go.mod"
	"github.com/go-test/deep v1.0.3"
	"github.com/go-test/deep v1.0.3/go.mod"
	"github.com/goccy/go-json v0.12.0"
	"github.com/goccy/go-json v0.12.0/go.mod"
	"github.com/goccy/go-yaml v1.19.2"
	"github.com/goccy/go-yaml v1.19.2/go.mod"
	"github.com/google/go-cmp v0.6.0"
	"github.com/google/go-cmp v0.6.0/go.mod"
	"github.com/hashicorp/hcl/v2 v2.25.0"
	"github.com/hashicorp/hcl/v2 v2.25.0/go.mod"
	"github.com/hexops/gotextdiff v1.0.3"
	"github.com/hexops/gotextdiff v1.0.3/go.mod"
	"github.com/inconshreveable/mousetrap v1.1.0"
	"github.com/inconshreveable/mousetrap v1.1.0/go.mod"
	"github.com/jinzhu/copier v0.4.0"
	"github.com/jinzhu/copier v0.4.0/go.mod"
	"github.com/magiconair/properties v1.18.12"
	"github.com/magiconair/properties v1.18.12/go.mod"
	"github.com/mattn/go-colorable v0.1.14"
	"github.com/mattn/go-colorable v0.1.14/go.mod"
	"github.com/mattn/go-isatty v0.0.24"
	"github.com/mattn/go-isatty v0.0.24/go.mod"
	"github.com/mitchellh/go-wordwrap v1.0.1"
	"github.com/mitchellh/go-wordwrap v1.0.1/go.mod"
	"github.com/pelletier/go-toml/v2 v2.4.3"
	"github.com/pelletier/go-toml/v2 v2.4.3/go.mod"
	"github.com/pkg/diff v0.0.0-20210226163009-20ebb0f2a09e"
	"github.com/pkg/diff v0.0.0-20210226163009-20ebb0f2a09e/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/russross/blackfriday/v2 v2.1.0/go.mod"
	"github.com/spf13/cobra v1.10.2"
	"github.com/spf13/cobra v1.10.2/go.mod"
	"github.com/spf13/pflag v1.0.9/go.mod"
	"github.com/spf13/pflag v1.0.10"
	"github.com/spf13/pflag v1.0.10/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.7.0"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/yuin/gopher-lua v1.1.2"
	"github.com/yuin/gopher-lua v1.1.2/go.mod"
	"github.com/zclconf/go-cty v1.19.0"
	"github.com/zclconf/go-cty v1.19.0/go.mod"
	"github.com/zclconf/go-cty-debug v0.0.0-20240509010212-0d6042c53940"
	"github.com/zclconf/go-cty-debug v0.0.0-20240509010212-0d6042c53940/go.mod"
	"go.yaml.in/yaml/v3 v3.0.4/go.mod"
	"go.yaml.in/yaml/v4 v4.0.0-rc.7"
	"go.yaml.in/yaml/v4 v4.0.0-rc.7/go.mod"
	"golang.org/x/mod v0.42.0"
	"golang.org/x/mod v0.42.0/go.mod"
	"golang.org/x/net v0.62.0"
	"golang.org/x/net v0.62.0/go.mod"
	"golang.org/x/sync v0.24.0"
	"golang.org/x/sync v0.24.0/go.mod"
	"golang.org/x/sys v0.49.0"
	"golang.org/x/sys v0.49.0/go.mod"
	"golang.org/x/text v0.43.0"
	"golang.org/x/text v0.43.0/go.mod"
	"golang.org/x/tools v0.51.0"
	"golang.org/x/tools v0.51.0/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
)

go-module_set_globals

DESCRIPTION="yq is a portable command-line YAML, JSON and XML processor"
HOMEPAGE="https://github.com/mikefarah/yq"
SRC_URI="https://github.com/mikefarah/yq/tarball/aaf140c3af176b2e6cff7200ccbd5d7339910a48 -> yq-4.54.3-aaf140c.tar.gz
https://direct.funtoo.org/fb/29/6c/fb296cd28fde1a41df9f7c9fa717fe2bd7e65464ad2e19c41d9877702add9ee047c018b083840fb623766d8d8041c6f3b1d45d7ea0f263e4dc6f0a0a916f5a7c -> yq-go-4.54.3-funtoo-go-bundle-10410eed3a3797c18e22b83a3b608cccfe45ea7b34b69f169c34ec8cf91aa9437324f9fe50429404b368f30cd8fdfbf5ebb27163eda9edd1b237996913ffadd5.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"
S="${WORKDIR}/mikefarah-yq-aaf140c"

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