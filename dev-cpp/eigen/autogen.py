#!/usr/bin/env python3

import json

async def generate(hub, **pkginfo):
	gitlabid = 15462818
	gitlaburl = "gitlab.com"
	json_data = await hub.pkgtools.fetch.get_page(f"https://{gitlaburl}/api/v4/projects/{gitlabid}/releases", is_json=True)
	version = None
	url = None
	basever = "5.0"

	for item in json_data:
		try:
			version = item['tag_name']
			verlist = version.split(".")
			list(map(int, verlist))
			if len(verlist) > 1:
				if int(verlist[1]) >= 89 and int(verlist[0]) != 0:
					continue

			if basever:
				baselist = basever.split('.')
				baselen = len(baselist)
				if verlist[:baselen] != baselist:
					continue

			sources = item['assets']['sources']
			sources.reverse()

			for src in sources:
				if src['format'] in ['tar.bz2', 'tar.gz', 'tar.xz']:
					url = src['url']
					break

			if version and url:
				break

		except (IndexError, ValueError, KeyError):
			continue
	else:
		version = None

	if version and url:
		pkginfo['version'] = version
		final_name = f'{pkginfo["name"]}-{version}.{".".join(url.split(".")[-2:])}'
		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=final_name)]
		)
		ebuild.push()
# vim: ts=4 sw=4 noet
