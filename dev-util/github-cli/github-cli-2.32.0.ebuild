# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 go-module

EGO_SUM=(
	"github.com/!alec!aivazis/survey/v2 v2.3.7"
	"github.com/!alec!aivazis/survey/v2 v2.3.7/go.mod"
	"github.com/!make!now!just/heredoc v1.0.0"
	"github.com/!make!now!just/heredoc v1.0.0/go.mod"
	"github.com/!netflix/go-expect v0.0.0-20220104043353-73e0943537d2"
	"github.com/!netflix/go-expect v0.0.0-20220104043353-73e0943537d2/go.mod"
	"github.com/alecthomas/chroma v0.10.0"
	"github.com/alecthomas/chroma v0.10.0/go.mod"
	"github.com/alessio/shellescape v1.4.1"
	"github.com/alessio/shellescape v1.4.1/go.mod"
	"github.com/aymerick/douceur v0.2.0"
	"github.com/aymerick/douceur v0.2.0/go.mod"
	"github.com/briandowns/spinner v1.18.1"
	"github.com/briandowns/spinner v1.18.1/go.mod"
	"github.com/cenkalti/backoff/v4 v4.2.1"
	"github.com/cenkalti/backoff/v4 v4.2.1/go.mod"
	"github.com/charmbracelet/glamour v0.5.1-0.20220727184942-e70ff2d969da"
	"github.com/charmbracelet/glamour v0.5.1-0.20220727184942-e70ff2d969da/go.mod"
	"github.com/charmbracelet/lipgloss v0.5.0"
	"github.com/charmbracelet/lipgloss v0.5.0/go.mod"
	"github.com/cli/browser v1.0.0/go.mod"
	"github.com/cli/browser v1.2.0"
	"github.com/cli/browser v1.2.0/go.mod"
	"github.com/cli/crypto v0.0.0-20210929142629-6be313f59b03"
	"github.com/cli/crypto v0.0.0-20210929142629-6be313f59b03/go.mod"
	"github.com/cli/go-gh/v2 v2.0.1"
	"github.com/cli/go-gh/v2 v2.0.1/go.mod"
	"github.com/cli/oauth v1.0.1"
	"github.com/cli/oauth v1.0.1/go.mod"
	"github.com/cli/safeexec v1.0.0/go.mod"
	"github.com/cli/safeexec v1.0.1"
	"github.com/cli/safeexec v1.0.1/go.mod"
	"github.com/cli/shurcoo!l-graphql v0.0.3"
	"github.com/cli/shurcoo!l-graphql v0.0.3/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.2"
	"github.com/cpuguy83/go-md2man/v2 v2.0.2/go.mod"
	"github.com/creack/pty v1.1.9/go.mod"
	"github.com/creack/pty v1.1.17/go.mod"
	"github.com/creack/pty v1.1.18"
	"github.com/creack/pty v1.1.18/go.mod"
	"github.com/danieljoos/wincred v1.2.0"
	"github.com/danieljoos/wincred v1.2.0/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dlclark/regexp2 v1.4.0"
	"github.com/dlclark/regexp2 v1.4.0/go.mod"
	"github.com/fatih/color v1.7.0"
	"github.com/fatih/color v1.7.0/go.mod"
	"github.com/gabriel-vasile/mimetype v1.4.2"
	"github.com/gabriel-vasile/mimetype v1.4.2/go.mod"
	"github.com/gdamore/encoding v1.0.0"
	"github.com/gdamore/encoding v1.0.0/go.mod"
	"github.com/gdamore/tcell/v2 v2.5.4"
	"github.com/gdamore/tcell/v2 v2.5.4/go.mod"
	"github.com/godbus/dbus/v5 v5.1.0"
	"github.com/godbus/dbus/v5 v5.1.0/go.mod"
	"github.com/golang/protobuf v1.5.0/go.mod"
	"github.com/golang/protobuf v1.5.2"
	"github.com/golang/protobuf v1.5.2/go.mod"
	"github.com/google/go-cmp v0.5.5/go.mod"
	"github.com/google/go-cmp v0.5.9"
	"github.com/google/go-cmp v0.5.9/go.mod"
	"github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510"
	"github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510/go.mod"
	"github.com/gorilla/css v1.0.0"
	"github.com/gorilla/css v1.0.0/go.mod"
	"github.com/gorilla/websocket v1.4.1/go.mod"
	"github.com/gorilla/websocket v1.4.2"
	"github.com/gorilla/websocket v1.4.2/go.mod"
	"github.com/h2non/parth v0.0.0-20190131123155-b4df798d6542"
	"github.com/h2non/parth v0.0.0-20190131123155-b4df798d6542/go.mod"
	"github.com/hashicorp/errwrap v1.0.0"
	"github.com/hashicorp/errwrap v1.0.0/go.mod"
	"github.com/hashicorp/go-multierror v1.1.1"
	"github.com/hashicorp/go-multierror v1.1.1/go.mod"
	"github.com/hashicorp/go-version v1.3.0"
	"github.com/hashicorp/go-version v1.3.0/go.mod"
	"github.com/henvic/httpretty v0.1.2"
	"github.com/henvic/httpretty v0.1.2/go.mod"
	"github.com/hinshun/vt10x v0.0.0-20220119200601-820417d04eec"
	"github.com/hinshun/vt10x v0.0.0-20220119200601-820417d04eec/go.mod"
	"github.com/inconshreveable/mousetrap v1.0.1"
	"github.com/inconshreveable/mousetrap v1.0.1/go.mod"
	"github.com/itchyny/gojq v0.12.13"
	"github.com/itchyny/gojq v0.12.13/go.mod"
	"github.com/itchyny/timefmt-go v0.1.5"
	"github.com/itchyny/timefmt-go v0.1.5/go.mod"
	"github.com/joho/godotenv v1.5.1"
	"github.com/joho/godotenv v1.5.1/go.mod"
	"github.com/kballard/go-shellquote v0.0.0-20180428030007-95032a82bc51"
	"github.com/kballard/go-shellquote v0.0.0-20180428030007-95032a82bc51/go.mod"
	"github.com/kr/pretty v0.1.0"
	"github.com/kr/text v0.2.0"
	"github.com/kr/text v0.2.0/go.mod"
	"github.com/lucasb-eyer/go-colorful v1.2.0"
	"github.com/lucasb-eyer/go-colorful v1.2.0/go.mod"
	"github.com/mattn/go-colorable v0.1.2/go.mod"
	"github.com/mattn/go-colorable v0.1.13"
	"github.com/mattn/go-colorable v0.1.13/go.mod"
	"github.com/mattn/go-isatty v0.0.8/go.mod"
	"github.com/mattn/go-isatty v0.0.14/go.mod"
	"github.com/mattn/go-isatty v0.0.16/go.mod"
	"github.com/mattn/go-isatty v0.0.19"
	"github.com/mattn/go-isatty v0.0.19/go.mod"
	"github.com/mattn/go-runewidth v0.0.9/go.mod"
	"github.com/mattn/go-runewidth v0.0.10/go.mod"
	"github.com/mattn/go-runewidth v0.0.12/go.mod"
	"github.com/mattn/go-runewidth v0.0.13/go.mod"
	"github.com/mattn/go-runewidth v0.0.14"
	"github.com/mattn/go-runewidth v0.0.14/go.mod"
	"github.com/mgutz/ansi v0.0.0-20170206155736-9520e82c474b/go.mod"
	"github.com/mgutz/ansi v0.0.0-20200706080929-d51e80ef957d"
	"github.com/mgutz/ansi v0.0.0-20200706080929-d51e80ef957d/go.mod"
	"github.com/microcosm-cc/bluemonday v1.0.19/go.mod"
	"github.com/microcosm-cc/bluemonday v1.0.20"
	"github.com/microcosm-cc/bluemonday v1.0.20/go.mod"
	"github.com/muesli/reflow v0.2.1-0.20210115123740-9e1d0d53df68/go.mod"
	"github.com/muesli/reflow v0.3.0"
	"github.com/muesli/reflow v0.3.0/go.mod"
	"github.com/muesli/termenv v0.11.0/go.mod"
	"github.com/muesli/termenv v0.11.1-0.20220204035834-5ac8409525e0/go.mod"
	"github.com/muesli/termenv v0.12.0"
	"github.com/muesli/termenv v0.12.0/go.mod"
	"github.com/muhammadmuzzammil1998/jsonc v0.0.0-20201229145248-615b0916ca38"
	"github.com/muhammadmuzzammil1998/jsonc v0.0.0-20201229145248-615b0916ca38/go.mod"
	"github.com/nbio/st v0.0.0-20140626010706-e9e8d9816f32"
	"github.com/nbio/st v0.0.0-20140626010706-e9e8d9816f32/go.mod"
	"github.com/olekukonko/tablewriter v0.0.5"
	"github.com/olekukonko/tablewriter v0.0.5/go.mod"
	"github.com/opentracing/opentracing-go v1.1.0"
	"github.com/opentracing/opentracing-go v1.1.0/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/rivo/tview v0.0.0-20221029100920-c4a7e501810d"
	"github.com/rivo/tview v0.0.0-20221029100920-c4a7e501810d/go.mod"
	"github.com/rivo/uniseg v0.1.0/go.mod"
	"github.com/rivo/uniseg v0.2.0/go.mod"
	"github.com/rivo/uniseg v0.4.4"
	"github.com/rivo/uniseg v0.4.4/go.mod"
	"github.com/russross/blackfriday/v2 v2.1.0"
	"github.com/russross/blackfriday/v2 v2.1.0/go.mod"
	"github.com/shurcoo!l/githubv4 v0.0.0-20230424031643-6cea62ecd5a9"
	"github.com/shurcoo!l/githubv4 v0.0.0-20230424031643-6cea62ecd5a9/go.mod"
	"github.com/shurcoo!l/graphql v0.0.0-20220606043923-3cf50f8a0a29"
	"github.com/shurcoo!l/graphql v0.0.0-20220606043923-3cf50f8a0a29/go.mod"
	"github.com/sourcegraph/jsonrpc2 v0.1.0"
	"github.com/sourcegraph/jsonrpc2 v0.1.0/go.mod"
	"github.com/spf13/cobra v1.6.1"
	"github.com/spf13/cobra v1.6.1/go.mod"
	"github.com/spf13/pflag v1.0.5"
	"github.com/spf13/pflag v1.0.5/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.4.0/go.mod"
	"github.com/stretchr/objx v0.5.0"
	"github.com/stretchr/objx v0.5.0/go.mod"
	"github.com/stretchr/testify v1.6.1/go.mod"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/stretchr/testify v1.7.1/go.mod"
	"github.com/stretchr/testify v1.8.0/go.mod"
	"github.com/stretchr/testify v1.8.4"
	"github.com/stretchr/testify v1.8.4/go.mod"
	"github.com/thlib/go-timezone-local v0.0.0-20210907160436-ef149e42d28e"
	"github.com/thlib/go-timezone-local v0.0.0-20210907160436-ef149e42d28e/go.mod"
	"github.com/yuin/goldmark v1.2.1/go.mod"
	"github.com/yuin/goldmark v1.4.1/go.mod"
	"github.com/yuin/goldmark v1.4.4/go.mod"
	"github.com/yuin/goldmark v1.4.13"
	"github.com/yuin/goldmark v1.4.13/go.mod"
	"github.com/yuin/goldmark-emoji v1.0.1"
	"github.com/yuin/goldmark-emoji v1.0.1/go.mod"
	"github.com/zalando/go-keyring v0.2.3"
	"github.com/zalando/go-keyring v0.2.3/go.mod"
	"golang.org/x/mod v0.6.0-dev.0.20220106191415-9b9b3d81d5e3/go.mod"
	"golang.org/x/mod v0.6.0-dev.0.20220419223038-86c51ed26bb4/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
	"golang.org/x/net v0.0.0-20210614182718-04defd469f4e/go.mod"
	"golang.org/x/net v0.0.0-20211015210444-4f30a5c0130f/go.mod"
	"golang.org/x/net v0.0.0-20220722155237-a158d28d115b/go.mod"
	"golang.org/x/net v0.0.0-20220923203811-8be639271d50/go.mod"
	"golang.org/x/net v0.9.0"
	"golang.org/x/net v0.9.0/go.mod"
	"golang.org/x/oauth2 v0.4.0"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sync v0.0.0-20210220032951-036812b2e83c/go.mod"
	"golang.org/x/sync v0.0.0-20220722155255-886fb9371eb4/go.mod"
	"golang.org/x/sync v0.1.0"
	"golang.org/x/sync v0.1.0/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190222072716-a9d3bda3a223/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210423082822-04245dca01da/go.mod"
	"golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
	"golang.org/x/sys v0.0.0-20210616045830-e2b7044e8c71/go.mod"
	"golang.org/x/sys v0.0.0-20210630005230-0f9fa26af87c/go.mod"
	"golang.org/x/sys v0.0.0-20210831042530-f4d43177bf5e/go.mod"
	"golang.org/x/sys v0.0.0-20211019181941-9d821ace8654/go.mod"
	"golang.org/x/sys v0.0.0-20220209214540-3681064d5158/go.mod"
	"golang.org/x/sys v0.0.0-20220520151302-bc2c85ada10a/go.mod"
	"golang.org/x/sys v0.0.0-20220722155257-8c9f86f7a55f/go.mod"
	"golang.org/x/sys v0.0.0-20220728004956-3c1f35247d10/go.mod"
	"golang.org/x/sys v0.0.0-20220811171246-fbc7d0a398ab/go.mod"
	"golang.org/x/sys v0.6.0/go.mod"
	"golang.org/x/sys v0.8.0"
	"golang.org/x/sys v0.8.0/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/term v0.0.0-20210927222741-03fcf44c2211/go.mod"
	"golang.org/x/term v0.7.0"
	"golang.org/x/term v0.7.0/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/text v0.3.6/go.mod"
	"golang.org/x/text v0.3.7/go.mod"
	"golang.org/x/text v0.4.0/go.mod"
	"golang.org/x/text v0.5.0/go.mod"
	"golang.org/x/text v0.9.0"
	"golang.org/x/text v0.9.0/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod"
	"golang.org/x/tools v0.1.10/go.mod"
	"golang.org/x/tools v0.1.12/go.mod"
	"golang.org/x/tools v0.6.0"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1/go.mod"
	"google.golang.org/appengine v1.6.7"
	"google.golang.org/genproto v0.0.0-20230110181048-76db0878b65f"
	"google.golang.org/genproto v0.0.0-20230110181048-76db0878b65f/go.mod"
	"google.golang.org/grpc v1.53.0"
	"google.golang.org/grpc v1.53.0/go.mod"
	"google.golang.org/protobuf v1.26.0-rc.1/go.mod"
	"google.golang.org/protobuf v1.26.0/go.mod"
	"google.golang.org/protobuf v1.28.1"
	"google.golang.org/protobuf v1.28.1/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15/go.mod"
	"gopkg.in/h2non/gock.v1 v1.1.2"
	"gopkg.in/h2non/gock.v1 v1.1.2/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.1"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
)

go-module_set_globals

DESCRIPTION="GitHub CLI"
HOMEPAGE="https://github.com/cli/cli"
SRC_URI="https://github.com/cli/cli/tarball/8c7935e6cec01cc910e40bad6ec9999508eb4d83 -> cli-2.32.0-8c7935e.tar.gz
https://direct.funtoo.org/2c/75/75/2c7575dbc4c790907a8d5fcdda0946578c5839bd81f26bd30532869a6b534b0b4c2ab4c65d6dd13842a01f552815ca040bb8a4acb4faaab2ef1e11f4c62511ef -> github-cli-2.32.0-funtoo-go-bundle-d18b166e3aecdd305b337a6ebc0f2b102dac8c5a412221014319d10f09f3fa6a5388b44e0891091203ccec6059bb07a0ab5e9ae719b0fc124be255c3167ee582.tar.gz"
KEYWORDS="*"
LICENSE="MIT Apache-2.0 BSD BSD-2 MPL-2.0"
SLOT="0"
RDEPEND=">=dev-vcs/git-1.7.3"
RESTRICT+=" test "

post_src_unpack() {
	mv ${WORKDIR}/cli-cli-* ${S} || die
}

src_compile() {
	export GH_VERSION="v2.32.0"
	# Go LDFLAGS are not the same as GCC/Binutils LDFLAGS
	unset LDFLAGS
	# Once we set up cross compiling, this line will need to be adjusted
	# to compile for the target.
	# Everything else in this function happens on the host.
	emake

	einfo "Building man pages"
	emake manpages

	einfo "Building completions"
	go run ./cmd/gh completion -s bash > gh.bash-completion || die
	go run ./cmd/gh completion -s zsh > gh.zsh-completion || die
}

src_install() {
	dobin bin/gh
	dodoc README.md

	doman share/man/man?/gh*.?

	newbashcomp gh.bash-completion gh
	insinto /usr/share/zsh/site-functions
	newins gh.zsh-completion _gh
}
