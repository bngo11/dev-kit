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
	"github.com/alecthomas/repr v0.5.2"
	"github.com/alecthomas/repr v0.5.2/go.mod"
	"github.com/apparentlymart/go-textseg/v15 v15.0.0"
	"github.com/apparentlymart/go-textseg/v15 v15.0.0/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.6/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dimchansky/utfbom v1.1.1"
	"github.com/dimchansky/utfbom v1.1.1/go.mod"
	"github.com/elliotchance/orderedmap v1.8.0"
	"github.com/elliotchance/orderedmap v1.8.0/go.mod"
	"github.com/fatih/color v1.19.0"
	"github.com/fatih/color v1.19.0/go.mod"
	"github.com/go-ini/ini v1.67.0"
	"github.com/go-ini/ini v1.67.0/go.mod"
	"github.com/go-test/deep v1.0.3"
	"github.com/go-test/deep v1.0.3/go.mod"
	"github.com/goccy/go-json v0.10.6"
	"github.com/goccy/go-json v0.10.6/go.mod"
	"github.com/goccy/go-yaml v1.19.2"
	"github.com/goccy/go-yaml v1.19.2/go.mod"
	"github.com/google/go-cmp v0.6.0"
	"github.com/google/go-cmp v0.6.0/go.mod"
	"github.com/hashicorp/hcl/v2 v2.24.0"
	"github.com/hashicorp/hcl/v2 v2.24.0/go.mod"
	"github.com/hexops/gotextdiff v1.0.3"
	"github.com/hexops/gotextdiff v1.0.3/go.mod"
	"github.com/inconshreveable/mousetrap v1.1.0"
	"github.com/inconshreveable/mousetrap v1.1.0/go.mod"
	"github.com/jinzhu/copier v0.4.0"
	"github.com/jinzhu/copier v0.4.0/go.mod"
	"github.com/magiconair/properties v1.8.10"
	"github.com/magiconair/properties v1.8.10/go.mod"
	"github.com/mattn/go-colorable v0.1.14"
	"github.com/mattn/go-colorable v0.1.14/go.mod"
	"github.com/mattn/go-isatty v0.0.20"
	"github.com/mattn/go-isatty v0.0.20/go.mod"
	"github.com/mitchellh/go-wordwrap v1.0.1"
	"github.com/mitchellh/go-wordwrap v1.0.1/go.mod"
	"github.com/pelletier/go-toml/v2 v2.3.1"
	"github.com/pelletier/go-toml/v2 v2.3.1/go.mod"
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
	"github.com/zclconf/go-cty v1.18.1"
	"github.com/zclconf/go-cty v1.18.1/go.mod"
	"github.com/zclconf/go-cty-debug v0.0.0-20240509010212-0d6042c53940"
	"github.com/zclconf/go-cty-debug v0.0.0-20240509010212-0d6042c53940/go.mod"
	"go.yaml.in/yaml/v3 v3.0.4/go.mod"
	"go.yaml.in/yaml/v4 v4.0.0-rc.4"
	"go.yaml.in/yaml/v4 v4.0.0-rc.4/go.mod"
	"golang.org/x/mod v0.36.0"
	"golang.org/x/mod v0.36.0/go.mod"
	"golang.org/x/net v0.55.0"
	"golang.org/x/net v0.55.0/go.mod"
	"golang.org/x/sync v0.20.0"
	"golang.org/x/sync v0.20.0/go.mod"
	"golang.org/x/sys v0.6.0/go.mod"
	"golang.org/x/sys v0.45.0"
	"golang.org/x/sys v0.45.0/go.mod"
	"golang.org/x/text v0.37.0"
	"golang.org/x/text v0.37.0/go.mod"
	"golang.org/x/tools v0.44.0"
	"golang.org/x/tools v0.44.0/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
)

go-module_set_globals

DESCRIPTION="yq is a portable command-line YAML, JSON and XML processor"
HOMEPAGE="https://github.com/mikefarah/yq"
SRC_URI="https://github.com/mikefarah/yq/tarball/038d06d4e7a99b076ca40b409de5225b49b78a4c -> yq-4.53.3-038d06d.tar.gz
https://direct.funtoo.org/17/b6/a3/17b6a3d2419d30f32aa991d3b3de6b892e65861c25b8738efaea7ca5196b6186303710185031fbaca2736999ded2a4cf05543fbe3ff58b8c09006cd7ce99114d -> yq-go-4.53.3-funtoo-go-bundle-5812db6306662dcdc95f1a548c6ec11bdf8f0b1ae9bf383ab211dbb16d21f2e0ca61fc68f9f3a7519a4875f45ca21442df928bc2bb1a171c5c367176ec47a18e.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"
S="${WORKDIR}/mikefarah-yq-038d06d"

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