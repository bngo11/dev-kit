# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
aho-corasick-0.7.18
ansi_term-0.12.1
assert_cmd-1.0.8
atty-0.2.14
autocfg-1.1.0
bitflags-1.3.2
bstr-0.2.17
cfg-if-1.0.0
clap-3.2.17
clap_complete-3.2.4
clap_lex-0.2.4
config-file-0.2.3
crossbeam-channel-0.5.6
crossbeam-deque-0.8.2
crossbeam-epoch-0.9.10
crossbeam-utils-0.8.11
difflib-0.4.0
directories-4.0.1
dirs-sys-0.3.7
doc-comment-0.3.3
either-1.8.0
fastrand-1.8.0
getrandom-0.2.7
hashbrown-0.12.3
hermit-abi-0.1.19
indexmap-1.9.1
instant-0.1.12
itertools-0.10.3
lazy_static-1.4.0
libc-0.2.132
lscolors-0.7.1
memchr-2.5.0
memoffset-0.6.5
num_cpus-1.13.1
once_cell-1.13.1
os_str_bytes-6.3.0
predicates-2.1.1
predicates-core-1.0.3
predicates-tree-1.0.5
proc-macro2-1.0.43
quote-1.0.21
rayon-1.5.3
rayon-core-1.9.3
redox_syscall-0.2.16
redox_users-0.4.3
regex-1.6.0
regex-automata-0.1.10
regex-syntax-0.6.27
remove_dir_all-0.5.3
scopeguard-1.1.0
serde-1.0.143
serde_derive-1.0.143
stfu8-0.2.5
strsim-0.10.0
syn-1.0.99
tempfile-3.3.0
termcolor-1.1.3
terminal_size-0.1.17
termtree-0.2.4
textwrap-0.15.0
thiserror-1.0.32
thiserror-impl-1.0.32
thousands-0.2.0
toml-0.5.9
unicode-ident-1.0.3
unicode-width-0.1.9
wait-timeout-0.2.0
wasi-0.11.0+wasi-snapshot-preview1
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="A more intuitive version of du in rust"
HOMEPAGE="https://github.com/bootandy/dust"
SRC_URI="https://api.github.com/repos/bootandy/dust/tarball/v0.8.2 -> dust-0.8.2.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND=">=virtual/rust-1.54.0"

QA_FLAGS_IGNORED="/usr/bin/dust"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/bootandy-dust-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}