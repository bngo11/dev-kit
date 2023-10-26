# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="adler-1.0.2
ahash-0.8.6
aho-corasick-1.1.2
anstream-0.6.4
anstyle-1.0.4
anstyle-parse-0.2.2
anstyle-query-1.0.0
anstyle-wincon-3.0.1
anyhow-1.0.75
arc-swap-1.6.0
arrayvec-0.5.2
autocfg-1.1.0
base16ct-0.2.0
base64-0.21.5
base64ct-1.6.0
bitflags-1.3.2
bitflags-2.4.1
bitmaps-2.1.0
block-buffer-0.10.4
bstr-1.7.0
btoi-0.4.3
bumpalo-3.14.0
bytes-1.5.0
bytesize-1.3.0
cargo-0.74.0
cargo-credential-0.3.0
cargo-credential-libsecret-0.3.1
cargo-credential-macos-keychain-0.3.0
cargo-credential-wincred-0.3.0
cargo-platform-0.1.4
cargo-util-0.2.6
cbindgen-0.26.0
cc-1.0.83
cfg-if-1.0.0
clap-4.4.7
clap_builder-4.4.7
clap_derive-4.4.7
clap_lex-0.6.0
clru-0.6.1
colorchoice-1.0.0
const-oid-0.9.5
core-foundation-0.9.3
core-foundation-sys-0.8.4
cpufeatures-0.2.11
crates-io-0.38.0
crc32fast-1.3.2
crossbeam-channel-0.5.8
crossbeam-utils-0.8.16
crypto-bigint-0.5.3
crypto-common-0.1.6
ct-codecs-1.1.1
curl-0.4.44
curl-sys-0.4.68+curl-8.4.0
der-0.7.8
deranged-0.3.9
digest-0.10.7
dunce-1.0.4
ecdsa-0.16.8
ed25519-compact-2.0.4
either-1.9.0
elliptic-curve-0.13.6
equivalent-1.0.1
errno-0.3.5
faster-hex-0.8.1
fastrand-2.0.1
ff-0.13.0
fiat-crypto-0.2.1
filetime-0.2.22
flate2-1.0.28
fnv-1.0.7
foreign-types-0.3.2
foreign-types-shared-0.1.1
form_urlencoded-1.2.0
fwdansi-1.1.0
generic-array-0.14.7
getrandom-0.2.10
git2-0.17.2
git2-curl-0.18.0
gix-0.45.1
gix-actor-0.21.0
gix-attributes-0.13.1
gix-bitmap-0.2.7
gix-chunk-0.4.4
gix-command-0.2.10
gix-commitgraph-0.16.0
gix-config-0.23.0
gix-config-value-0.12.5
gix-credentials-0.15.0
gix-date-0.5.1
gix-diff-0.30.1
gix-discover-0.19.0
gix-features-0.30.0
gix-fs-0.2.0
gix-glob-0.8.0
gix-hash-0.11.4
gix-hashtable-0.2.4
gix-ignore-0.3.0
gix-index-0.17.0
gix-lock-6.0.0
gix-mailmap-0.13.0
gix-negotiate-0.2.1
gix-object-0.30.0
gix-odb-0.46.0
gix-pack-0.36.0
gix-packetline-0.16.7
gix-path-0.8.4
gix-prompt-0.5.5
gix-protocol-0.33.2
gix-quote-0.4.7
gix-ref-0.30.0
gix-refspec-0.11.0
gix-revision-0.15.2
gix-revwalk-0.1.0
gix-sec-0.8.4
gix-tempfile-6.0.0
gix-trace-0.1.3
gix-transport-0.32.0
gix-traverse-0.26.0
gix-url-0.19.0
gix-utils-0.1.5
gix-validate-0.7.7
gix-worktree-0.18.0
glob-0.3.1
globset-0.4.13
group-0.13.0
hashbrown-0.12.3
hashbrown-0.14.2
heck-0.4.1
hex-0.4.3
hkdf-0.12.3
hmac-0.12.1
home-0.5.5
http-auth-0.1.8
humantime-2.1.0
idna-0.4.0
ignore-0.4.20
im-rc-15.1.0
imara-diff-0.1.5
indexmap-1.9.3
indexmap-2.0.2
io-close-0.3.7
itertools-0.10.5
itertools-0.11.0
itoa-1.0.9
jobserver-0.1.27
js-sys-0.3.64
kstring-2.0.0
lazy_static-1.4.0
lazycell-1.3.0
libc-0.2.149
libgit2-sys-0.15.2+1.6.4
libloading-0.8.1
libnghttp2-sys-0.1.8+1.55.1
libssh2-sys-0.3.0
libz-sys-1.1.12
linux-raw-sys-0.4.10
lock_api-0.4.11
log-0.4.20
matchers-0.1.0
maybe-async-0.2.7
memchr-2.6.4
memmap2-0.5.10
minimal-lexical-0.2.1
miniz_oxide-0.7.1
miow-0.6.0
nom-7.1.3
normpath-1.1.1
nu-ansi-term-0.46.0
num-traits-0.2.17
num_threads-0.1.6
once_cell-1.18.0
opener-0.6.1
openssl-0.10.57
openssl-macros-0.1.1
openssl-probe-0.1.5
openssl-src-300.1.6+3.1.4
openssl-sys-0.9.93
ordered-float-2.10.1
orion-0.17.6
os_info-3.7.0
overload-0.1.1
p384-0.13.0
parking_lot-0.12.1
parking_lot_core-0.9.9
pasetors-0.6.7
pathdiff-0.2.1
pem-rfc7468-0.7.0
percent-encoding-2.3.0
pin-project-lite-0.2.13
pkcs8-0.10.2
pkg-config-0.3.27
powerfmt-0.2.0
ppv-lite86-0.2.17
primeorder-0.13.2
proc-macro2-1.0.69
prodash-25.0.2
pulldown-cmark-0.9.3
quote-1.0.33
rand-0.8.5
rand_chacha-0.3.1
rand_core-0.6.4
rand_xoshiro-0.6.0
redox_syscall-0.3.5
redox_syscall-0.4.1
regex-1.10.2
regex-automata-0.1.10
regex-automata-0.4.3
regex-syntax-0.6.29
regex-syntax-0.8.2
rfc6979-0.4.0
rustfix-0.6.1
rustix-0.38.20
ryu-1.0.15
same-file-1.0.6
schannel-0.1.22
scopeguard-1.2.0
sec1-0.7.3
security-framework-2.9.2
security-framework-sys-2.9.1
semver-1.0.20
serde-1.0.190
serde-value-0.7.0
serde_derive-1.0.190
serde_ignored-0.1.9
serde_json-1.0.107
serde_spanned-0.6.4
sha1-0.10.6
sha1_smol-1.0.0
sha2-0.10.8
sharded-slab-0.1.7
shell-escape-0.1.5
signal-hook-0.3.17
signal-hook-registry-1.4.1
signature-2.1.0
sized-chunks-0.6.5
smallvec-1.11.1
socket2-0.4.10
spki-0.7.2
static_assertions-1.1.0
strip-ansi-escapes-0.1.1
strsim-0.10.0
subtle-2.5.0
syn-1.0.109
syn-2.0.38
tar-0.4.40
tempfile-3.8.0
termcolor-1.3.0
terminal_size-0.3.0
thiserror-1.0.50
thiserror-impl-1.0.50
thread_local-1.1.7
time-0.3.30
time-core-0.1.2
time-macros-0.2.15
tinyvec-1.6.0
tinyvec_macros-0.1.1
toml-0.5.11
toml-0.7.8
toml_datetime-0.6.5
toml_edit-0.19.15
tracing-0.1.40
tracing-attributes-0.1.27
tracing-core-0.1.32
tracing-log-0.1.4
tracing-subscriber-0.3.17
typenum-1.17.0
unicase-2.7.0
unicode-bidi-0.3.13
unicode-bom-2.0.2
unicode-ident-1.0.12
unicode-normalization-0.1.22
unicode-width-0.1.11
unicode-xid-0.2.4
url-2.4.1
utf8parse-0.2.1
valuable-0.1.0
vcpkg-0.2.15
version_check-0.9.4
vte-0.10.1
vte_generate_state_changes-0.1.1
walkdir-2.4.0
wasi-0.11.0+wasi-snapshot-preview1
wasm-bindgen-0.2.87
wasm-bindgen-backend-0.2.87
wasm-bindgen-macro-0.2.87
wasm-bindgen-macro-support-0.2.87
wasm-bindgen-shared-0.2.87
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.6
winapi-x86_64-pc-windows-gnu-0.4.0
windows-0.48.0
windows-sys-0.48.0
windows-targets-0.48.5
windows_aarch64_gnullvm-0.48.5
windows_aarch64_msvc-0.48.5
windows_i686_gnu-0.48.5
windows_i686_msvc-0.48.5
windows_x86_64_gnu-0.48.5
windows_x86_64_gnullvm-0.48.5
windows_x86_64_msvc-0.48.5
winnow-0.5.17
zerocopy-0.7.15
zerocopy-derive-0.7.15
zeroize-1.6.0
"

inherit cargo

DESCRIPTION="Cargo applet to build and install C-ABI compatible dynamic and static libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://api.github.com/repos/lu-zero/cargo-c/tarball/v0.9.27 -> cargo-c-0.9.27.tar.gz
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