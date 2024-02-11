# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="adler-1.0.2
ahash-0.8.8
aho-corasick-1.1.2
allocator-api2-0.2.16
anstream-0.6.11
anstyle-1.0.6
anstyle-parse-0.2.3
anstyle-query-1.0.2
anstyle-wincon-3.0.2
anyhow-1.0.79
arc-swap-1.6.0
autocfg-1.1.0
base16ct-0.2.0
base64-0.21.7
base64ct-1.6.0
bitflags-1.3.2
bitflags-2.4.2
bitmaps-2.1.0
block-buffer-0.10.4
bstr-1.9.0
btoi-0.4.3
bumpalo-3.14.0
bytes-1.5.0
bytesize-1.3.0
cargo-0.77.0
cargo-credential-0.4.2
cargo-credential-libsecret-0.4.2
cargo-credential-macos-keychain-0.4.2
cargo-credential-wincred-0.4.2
cargo-platform-0.1.7
cargo-util-0.2.9
cbindgen-0.26.0
cc-1.0.83
cfg-if-1.0.0
clap-4.5.0
clap_builder-4.5.0
clap_derive-4.5.0
clap_lex-0.7.0
clru-0.6.1
color-print-0.3.5
color-print-proc-macro-0.3.5
colorchoice-1.0.0
const-oid-0.9.6
core-foundation-0.9.4
core-foundation-sys-0.8.6
cpufeatures-0.2.12
crates-io-0.39.2
crc32fast-1.3.2
crossbeam-channel-0.5.11
crossbeam-deque-0.8.5
crossbeam-epoch-0.9.18
crossbeam-utils-0.8.19
crypto-bigint-0.5.5
crypto-common-0.1.6
ct-codecs-1.1.1
curl-0.4.45
curl-sys-0.4.72+curl-8.6.0
der-0.7.8
deranged-0.3.11
digest-0.10.7
dunce-1.0.4
ecdsa-0.16.9
ed25519-compact-2.1.1
either-1.10.0
elliptic-curve-0.13.8
encoding_rs-0.8.33
equivalent-1.0.1
erased-serde-0.4.2
errno-0.3.8
fallible-iterator-0.3.0
fallible-streaming-iterator-0.1.9
faster-hex-0.9.0
fastrand-2.0.1
ff-0.13.0
fiat-crypto-0.2.6
filetime-0.2.23
flate2-1.0.28
foreign-types-0.3.2
foreign-types-shared-0.1.1
form_urlencoded-1.2.1
generic-array-0.14.7
getrandom-0.2.12
git2-0.18.2
git2-curl-0.19.0
gix-0.56.0
gix-actor-0.28.1
gix-attributes-0.20.1
gix-bitmap-0.2.10
gix-chunk-0.4.7
gix-command-0.3.4
gix-commitgraph-0.22.1
gix-config-0.32.1
gix-config-value-0.14.4
gix-credentials-0.22.0
gix-date-0.8.3
gix-diff-0.38.0
gix-discover-0.27.0
gix-features-0.35.0
gix-features-0.36.1
gix-filter-0.7.0
gix-fs-0.8.1
gix-glob-0.14.1
gix-hash-0.13.3
gix-hashtable-0.4.1
gix-ignore-0.9.1
gix-index-0.27.1
gix-lock-11.0.1
gix-macros-0.1.3
gix-negotiate-0.10.0
gix-object-0.39.0
gix-odb-0.55.0
gix-pack-0.45.0
gix-packetline-0.17.3
gix-packetline-blocking-0.17.3
gix-path-0.10.5
gix-pathspec-0.4.1
gix-prompt-0.8.2
gix-protocol-0.42.0
gix-quote-0.4.10
gix-ref-0.39.1
gix-refspec-0.20.0
gix-revision-0.24.0
gix-revwalk-0.10.0
gix-sec-0.10.4
gix-submodule-0.6.0
gix-tempfile-11.0.1
gix-trace-0.1.7
gix-transport-0.39.0
gix-traverse-0.35.0
gix-url-0.25.2
gix-utils-0.1.9
gix-validate-0.8.3
gix-worktree-0.28.0
glob-0.3.1
globset-0.4.14
group-0.13.0
hashbrown-0.12.3
hashbrown-0.14.3
hashlink-0.8.4
heck-0.4.1
hermit-abi-0.3.5
hex-0.4.3
hkdf-0.12.4
hmac-0.12.1
home-0.5.9
http-auth-0.1.9
humantime-2.1.0
idna-0.5.0
ignore-0.4.22
im-rc-15.1.0
indexmap-1.9.3
indexmap-2.2.2
is-terminal-0.4.12
itertools-0.12.1
itoa-1.0.10
jobserver-0.1.28
js-sys-0.3.68
kstring-2.0.0
lazy_static-1.4.0
lazycell-1.3.0
libc-0.2.153
libgit2-sys-0.16.2+1.7.2
libloading-0.8.1
libnghttp2-sys-0.1.9+1.58.0
libsqlite3-sys-0.27.0
libssh2-sys-0.3.0
libz-sys-1.1.15
linux-raw-sys-0.4.13
lock_api-0.4.11
log-0.4.20
matchers-0.1.0
maybe-async-0.2.9
memchr-2.7.1
memmap2-0.9.4
minimal-lexical-0.2.1
miniz_oxide-0.7.2
miow-0.6.0
nom-7.1.3
normpath-1.1.1
nu-ansi-term-0.46.0
num-conv-0.1.0
num-traits-0.2.18
num_threads-0.1.6
once_cell-1.19.0
opener-0.6.1
openssl-0.10.63
openssl-macros-0.1.1
openssl-probe-0.1.5
openssl-src-300.2.2+3.2.1
openssl-sys-0.9.99
ordered-float-2.10.1
orion-0.17.6
os_info-3.7.0
overload-0.1.1
p384-0.13.0
parking_lot-0.12.1
parking_lot_core-0.9.9
pasetors-0.6.8
pathdiff-0.2.1
pem-rfc7468-0.7.0
percent-encoding-2.3.1
pin-project-lite-0.2.13
pkcs8-0.10.2
pkg-config-0.3.29
powerfmt-0.2.0
ppv-lite86-0.2.17
primeorder-0.13.6
proc-macro2-1.0.78
prodash-26.2.2
pulldown-cmark-0.9.6
quote-1.0.35
rand-0.8.5
rand_chacha-0.3.1
rand_core-0.6.4
rand_xoshiro-0.6.0
redox_syscall-0.4.1
regex-1.10.3
regex-automata-0.1.10
regex-automata-0.4.5
regex-syntax-0.6.29
regex-syntax-0.8.2
rfc6979-0.4.0
rusqlite-0.30.0
rustfix-0.7.0
rustix-0.38.31
ryu-1.0.16
same-file-1.0.6
schannel-0.1.23
scopeguard-1.2.0
sec1-0.7.3
security-framework-2.9.2
security-framework-sys-2.9.1
semver-1.0.21
serde-1.0.196
serde-untagged-0.1.5
serde-value-0.7.0
serde_derive-1.0.196
serde_ignored-0.1.10
serde_json-1.0.113
serde_spanned-0.6.5
sha1-0.10.6
sha1_smol-1.0.0
sha2-0.10.8
sharded-slab-0.1.7
shell-escape-0.1.5
shell-words-1.1.0
signature-2.2.0
sized-chunks-0.6.5
smallvec-1.13.1
socket2-0.5.5
spki-0.7.3
static_assertions-1.1.0
strsim-0.11.0
subtle-2.5.0
supports-hyperlinks-2.1.0
syn-1.0.109
syn-2.0.48
tar-0.4.40
tempfile-3.10.0
terminal_size-0.3.0
thiserror-1.0.57
thiserror-impl-1.0.57
thread_local-1.1.7
time-0.3.34
time-core-0.1.2
time-macros-0.2.17
tinyvec-1.6.0
tinyvec_macros-0.1.1
toml-0.5.11
toml-0.8.10
toml_datetime-0.6.5
toml_edit-0.21.1
toml_edit-0.22.4
tracing-0.1.40
tracing-attributes-0.1.27
tracing-core-0.1.32
tracing-log-0.2.0
tracing-subscriber-0.3.18
typenum-1.17.0
unicase-2.7.0
unicode-bidi-0.3.15
unicode-bom-2.0.3
unicode-ident-1.0.12
unicode-normalization-0.1.22
unicode-width-0.1.11
unicode-xid-0.2.4
url-2.5.0
utf8parse-0.2.1
valuable-0.1.0
vcpkg-0.2.15
version_check-0.9.4
walkdir-2.4.0
wasi-0.11.0+wasi-snapshot-preview1
wasm-bindgen-0.2.91
wasm-bindgen-backend-0.2.91
wasm-bindgen-macro-0.2.91
wasm-bindgen-macro-support-0.2.91
wasm-bindgen-shared-0.2.91
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.6
winapi-x86_64-pc-windows-gnu-0.4.0
windows-sys-0.48.0
windows-sys-0.52.0
windows-targets-0.48.5
windows-targets-0.52.0
windows_aarch64_gnullvm-0.48.5
windows_aarch64_gnullvm-0.52.0
windows_aarch64_msvc-0.48.5
windows_aarch64_msvc-0.52.0
windows_i686_gnu-0.48.5
windows_i686_gnu-0.52.0
windows_i686_msvc-0.48.5
windows_i686_msvc-0.52.0
windows_x86_64_gnu-0.48.5
windows_x86_64_gnu-0.52.0
windows_x86_64_gnullvm-0.48.5
windows_x86_64_gnullvm-0.52.0
windows_x86_64_msvc-0.48.5
windows_x86_64_msvc-0.52.0
winnow-0.5.39
zerocopy-0.7.32
zerocopy-derive-0.7.32
zeroize-1.7.0
"

inherit cargo

DESCRIPTION="Cargo applet to build and install C-ABI compatible dynamic and static libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://api.github.com/repos/lu-zero/cargo-c/tarball/v0.9.30 -> cargo-c-0.9.30.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="sys-libs/zlib
	dev-libs/openssl:0=
	net-libs/libssh2
	net-misc/curl[ssl]
"
BDEPEND=">=virtual/rust-1.66.0"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/lu-zero-cargo-c-* ${S} || die
}