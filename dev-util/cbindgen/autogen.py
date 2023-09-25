#!/usr/bin/env python3

import json

async def generate(hub, **pkginfo):
	json_data = await hub.pkgtools.fetch.get_page("https://api.github.com/repos/mozilla/cbindgen/releases", is_json=True)
	version = None
	url = None

	for item in json_data:
		try:
			if item["prerelease"] or item["draft"]:
				continue

			version = item["tag_name"]
			list(map(int, version.split(".")))

			for asset in item['assets']:
				asset_name = asset["name"]
				#url = asset["browser_download_url"]
				url = item["tarball_url"]
				break

			if url:
				break

		except (KeyError, IndexError, ValueError):
			continue

	print(version, url)
	if version and url:
		'''
		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			version=version,
			artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=asset_name)]
		)
		ebuild.push()
		'''

		final_name=f"{asset_name}-{version}.tar.gz"
		src_artifact = hub.pkgtools.ebuild.Artifact(url=url, final_name=final_name)
		artifacts = await hub.pkgtools.rust.generate_crates_from_artifact(src_artifact)

		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			version=version,
			crates=artifacts['crates'],
			artifacts=[
				src_artifact,
				*artifacts['crates_artifacts'],
			],
		)
		ebuild.push()


# vim: ts=4 sw=4 noet
