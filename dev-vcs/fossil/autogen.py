#!/usr/bin/env python3

import re

async def generate(hub, **pkginfo):
	uv_files = await hub.pkgtools.fetch.get_page("https://fossil-scm.org/home/uv/download.js")
	version = None
	fname = None

	for item in uv_files.split('"'):
		match = re.match(r"[a-z0-9]*/fossil-(src-)?([\d]+\.[\d\.]+).tar.gz", item)
		if match:
			version = match.group(2)
			fname = match.group(0)
			break

	if version and fname:
		url = f"http://www.fossil-scm.org/home/tarball/{fname}"
		final_name = f"fossil-{version}.tar.gz"
		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			version=version,
			artifacts = [hub.pkgtools.ebuild.Artifact(url=url, final_name=final_name)]
		)
		ebuild.push()
