# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="adler-1.0.2
aho-corasick-0.7.18
anyhow-1.0.57
arrayvec-0.5.2
atty-0.2.14
autocfg-1.1.0
bitflags-1.3.2
bitmaps-2.1.0
bstr-0.2.17
bytes-1.1.0
bytesize-1.1.0
cargo-0.62.0
cargo-platform-0.1.2
cargo-util-0.1.2
cbindgen-0.23.0
cc-1.0.73
cfg-if-1.0.0
clap-3.1.18
clap_derive-3.1.18
clap_lex-0.2.0
combine-4.6.4
commoncrypto-0.2.0
commoncrypto-sys-0.2.0
core-foundation-0.9.3
core-foundation-sys-0.8.3
crates-io-0.34.0
crc32fast-1.3.2
crossbeam-utils-0.8.8
crypto-hash-0.3.4
curl-0.4.43
curl-sys-0.4.55+curl-7.83.1
either-1.6.1
env_logger-0.9.0
fastrand-1.7.0
filetime-0.2.16
flate2-1.0.24
fnv-1.0.7
foreign-types-0.3.2
foreign-types-shared-0.1.1
form_urlencoded-1.0.1
fwdansi-1.1.0
git2-0.14.4
git2-curl-0.15.0
glob-0.3.0
globset-0.4.8
hashbrown-0.11.2
heck-0.4.0
hermit-abi-0.1.19
hex-0.3.2
hex-0.4.3
home-0.5.3
humantime-2.1.0
idna-0.2.3
ignore-0.4.18
im-rc-15.1.0
indexmap-1.8.2
instant-0.1.12
itertools-0.10.3
itoa-1.0.2
jobserver-0.1.24
kstring-1.0.6
lazy_static-1.4.0
lazycell-1.3.0
libc-0.2.126
libgit2-sys-0.13.4+1.4.2
libnghttp2-sys-0.1.7+1.45.0
libssh2-sys-0.2.23
libz-sys-1.1.8
log-0.4.17
matches-0.1.9
memchr-2.5.0
miniz_oxide-0.5.3
miow-0.3.7
once_cell-1.12.0
opener-0.5.0
openssl-0.10.40
openssl-macros-0.1.0
openssl-probe-0.1.5
openssl-src-111.20.0+1.1.1o
openssl-sys-0.9.74
os_info-3.4.0
os_str_bytes-6.1.0
percent-encoding-2.1.0
pkg-config-0.3.25
proc-macro-error-1.0.4
proc-macro-error-attr-1.0.4
proc-macro2-1.0.39
quote-1.0.18
rand_core-0.6.3
rand_xoshiro-0.6.0
redox_syscall-0.2.13
regex-1.5.6
regex-automata-0.1.10
regex-syntax-0.6.26
remove_dir_all-0.5.3
rustc-workspace-hack-1.0.0
rustfix-0.6.1
ryu-1.0.10
same-file-1.0.6
schannel-0.1.20
semver-1.0.9
serde-1.0.137
serde_derive-1.0.137
serde_ignored-0.1.3
serde_json-1.0.81
shell-escape-0.1.5
sized-chunks-0.6.5
socket2-0.4.4
strip-ansi-escapes-0.1.1
strsim-0.10.0
syn-1.0.96
tar-0.4.38
tempfile-3.3.0
termcolor-1.1.3
textwrap-0.15.0
thread_local-1.1.4
tinyvec-1.6.0
tinyvec_macros-0.1.0
toml-0.5.9
toml_edit-0.13.4
typenum-1.15.0
unicode-bidi-0.3.8
unicode-ident-1.0.0
unicode-normalization-0.1.19
unicode-width-0.1.9
unicode-xid-0.2.3
url-2.2.2
utf8parse-0.2.0
vcpkg-0.2.15
version_check-0.9.4
vte-0.10.1
vte_generate_state_changes-0.1.1
walkdir-2.3.2
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
windows-sys-0.36.1
windows_aarch64_msvc-0.36.1
windows_i686_gnu-0.36.1
windows_i686_msvc-0.36.1
windows_x86_64_gnu-0.36.1
windows_x86_64_msvc-0.36.1
"

inherit cargo

DESCRIPTION="Helper program to build and install c-like libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://api.github.com/repos/lu-zero/cargo-c/tarball/v0.9.10 -> cargo-c-0.9.10.tar.gz
	$(cargo_crate_uris ${CRATES})"

RESTRICT="mirror"
# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS="*"

BDEPEND="
	>=virtual/rust-1.51.0
"

RDEPEND="sys-libs/zlib
	dev-libs/openssl:0=
	net-libs/libssh2
	net-misc/curl[ssl]
"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/lu-zero-cargo-c-* ${S} || die
}