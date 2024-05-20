#!/usr/bin/env python3

import json

async def generate(hub, **pkginfo):
	json_data = await hub.pkgtools.fetch.get_page("https://api.github.com/repos/sharkdp/bat/releases", is_json=True)
	version = None
	url = None

	for item in json_data:
		try:
			if item["prerelease"] or item["draft"]:
				continue

			version = item["tag_name"].strip('v')
			list(map(int, version.split(".")))

			for asset in item['assets']:
				asset_name = asset["name"]
				url = item["tarball_url"]
				break

			if url:
				break

		except (KeyError, IndexError, ValueError):
			continue

	if version and url:
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