#!/usr/bin/env python3

import json
from datetime import timedelta

async def generate(hub, **pkginfo):
	json_data = await hub.pkgtools.fetch.get_page("https://api.github.com/repos/fribidi/fribidi/releases", is_json=True)
	version = None

	for item in json_data:
		if not item['prerelease']:
			try:
				version = item['tag_name'].strip('v')
				url = item['assets'][0]['browser_download_url']
				break

			except (IndexError, AttributeError, KeyError):
				continue

	if version and url:
		final_name = f"fribidi-{version}.tar.xz"
		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			version=version,
			artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=final_name)]
		)
		ebuild.push()

# vim: ts=4 sw=4 noet
