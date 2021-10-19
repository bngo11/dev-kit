#!/usr/bin/env python3

import json

async def generate(hub, **pkginfo):
	json_data = await hub.pkgtools.fetch.get_page("https://api.github.com/repos/martinpitt/umockdev/releases")
	json_list = json.loads(json_data)
	version = None
	url = None

	for item in json_list:
		try:
			version = item["tag_name"]
			url = item["assets"][0]["browser_download_url"]
			pkg_name = item["assets"][0]["name"]
			break

		except (IndexError, AttributeError) as err:
			print(err)
			continue

	if version and url and pkg_name:
		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			version=version,
			artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=pkg_name)]
		)
		ebuild.push()

# vim: ts=4 sw=4 noet
