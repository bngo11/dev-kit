# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
atty-0.2.14
autocfg-1.1.0
bitflags-1.3.2
cfg-if-1.0.0
clap-3.1.6
fastrand-1.7.0
hashbrown-0.11.2
heck-0.4.0
hermit-abi-0.1.19
indexmap-1.8.0
instant-0.1.12
itoa-1.0.1
lazy_static-1.4.0
libc-0.2.121
lock_api-0.4.6
log-0.4.16
memchr-2.4.1
os_str_bytes-6.0.0
parking_lot-0.11.2
parking_lot_core-0.8.5
proc-macro2-1.0.36
quote-1.0.17
redox_syscall-0.2.12
remove_dir_all-0.5.3
ryu-1.0.9
scopeguard-1.1.0
serde-1.0.136
serde_derive-1.0.136
serde_json-1.0.79
serial_test-0.5.1
serial_test_derive-0.5.1
smallvec-1.8.0
strsim-0.10.0
syn-1.0.89
tempfile-3.3.0
termcolor-1.1.3
textwrap-0.15.0
toml-0.5.8
unicode-xid-0.2.2
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="A tool for generating C bindings to Rust code"
HOMEPAGE="https://github.com/eqrion/cbindgen"
SRC_URI="https://api.github.com/repos/mozilla/cbindgen/tarball/v0.24.3 -> cbindgen-0.24.3.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT MPL-2.0 Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

QA_FLAGS_IGNORED="/usr/bin/cbindgen"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/eqrion-cbindgen-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}