# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
adler32-1.0.4
aho-corasick-0.7.6
ansi_term-0.11.0
ansi_term-0.12.1
arrayref-0.3.5
arrayvec-0.5.1
atty-0.2.13
autocfg-0.1.7
avro-rs-0.6.5
backtrace-0.3.40
backtrace-sys-0.1.32
base64-0.10.1
bitflags-1.2.1
blake2b_simd-0.5.9
bstr-0.2.8
build_const-0.2.1
built-0.3.2
byteorder-1.3.2
cc-1.0.47
cfg-if-0.1.10
chrono-0.4.9
clap-2.33.0
cloudabi-0.0.3
constant_time_eq-0.1.4
crc-1.8.1
crc32fast-1.2.0
crossbeam-utils-0.6.6
csv-1.1.1
csv-core-0.1.6
digest-0.8.1
directories-2.0.2
dirs-sys-0.3.4
dtoa-0.4.4
env_logger-0.7.1
failure-0.1.6
failure_derive-0.1.6
fuchsia-cprng-0.1.1
generic-array-0.12.3
getrandom-0.1.13
git2-0.10.1
glob-0.3.0
half-1.4.0
heck-0.3.1
hermit-abi-0.1.3
humantime-1.3.0
idna-0.2.0
itoa-0.4.4
jobserver-0.1.17
lazy_static-1.4.0
libc-0.2.65
libflate-0.1.27
libgit2-sys-0.9.1
libz-sys-1.0.25
linked-hash-map-0.3.0
linked-hash-map-0.5.2
log-0.4.8
matches-0.1.8
maybe-uninit-2.0.0
memchr-2.2.1
nix-0.15.0
num-integer-0.1.41
num-traits-0.1.43
num-traits-0.2.9
num_cpus-1.11.1
ordered-float-1.0.2
percent-encoding-2.1.0
pest-2.1.2
pkg-config-0.3.17
proc-macro-error-0.2.6
proc-macro2-1.0.6
protobuf-2.8.1
quick-error-1.2.2
quote-1.0.2
rand-0.3.23
rand-0.4.6
rand_core-0.3.1
rand_core-0.4.2
rand_os-0.1.3
rdrand-0.4.0
redox_syscall-0.1.56
redox_users-0.3.1
regex-1.3.1
regex-automata-0.1.8
regex-syntax-0.6.12
rle-decode-fast-1.0.1
rmp-0.8.8
rmpv-0.4.2
rust-argon2-0.5.1
rustc-demangle-0.1.16
ryu-1.0.2
semver-0.9.0
semver-parser-0.7.0
serde-0.8.23
serde-1.0.102
serde-hjson-0.9.1
serde-protobuf-0.8.1
serde_cbor-0.10.2
serde_derive-1.0.102
serde_json-1.0.41
serde_test-0.8.23
serde_yaml-0.8.11
smallvec-0.6.13
snap-0.2.5
strsim-0.8.0
structopt-0.3.4
structopt-derive-0.3.4
syn-1.0.8
synstructure-0.12.3
take_mut-0.2.2
termcolor-1.0.5
textwrap-0.11.0
thread_local-0.3.6
time-0.1.42
toml-0.5.5
typenum-1.11.2
ucd-trie-0.1.2
unicode-bidi-0.3.4
unicode-normalization-0.1.9
unicode-segmentation-1.6.0
unicode-width-0.1.6
unicode-xid-0.2.0
url-2.1.0
vcpkg-0.2.7
vec_map-0.8.1
vergen-3.0.4
void-1.0.2
wasi-0.7.0
winapi-0.3.8
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.2
winapi-x86_64-pc-windows-gnu-0.4.0
wincolor-1.0.2
yaml-rust-0.4.3
"

inherit cargo

DESCRIPTION="A tool for doing record analysis and transformation"
HOMEPAGE="https://github.com/dflemstr/rq"
SRC_URI="https://api.github.com/repos/dflemstr/rq/tarball/v1.0.2 -> rq-1.0.2.tar.gz
	$(cargo_crate_uris ${CRATES})"
LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions Boost-1.0 BSD BSD-2 CC0-1.0 GPL-2-with-linking-exception ISC LGPL-2+ MIT PCRE unicode Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND="${RUST_DEPEND}"
RDEPEND="!dev-python/rq"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/dflemstr-rq-* ${S} || die
}

src_install() {
	cargo_src_install
	dodoc -r {doc,{README,CONTRIBUTING}.md}
}
