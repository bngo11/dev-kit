#!/usr/bin/env python3

import json

async def generate(hub, **pkginfo):
	github_list = [("nlohmann", "json"), ("nlohmann", "json_test_data")]
	artifacts_list = []

	for github_user, github_repo in github_list:
		json_data = await hub.pkgtools.fetch.get_page(f"https://api.github.com/repos/{github_user}/{github_repo}/releases", is_json=True)
		version = None
		url = None

		for item in json_data:
			try:
				if item["prerelease"] or item["draft"]:
					continue

				version = item["tag_name"].lstrip("v")
				list(map(int, version.split(".")))
				url = item["tarball_url"]
				artifacts_list.append((version, f"{github_repo}-{version}.tar.gz", url))
				break

			except (KeyError, IndexError, ValueError):
				continue

	if artifacts_list:
		pkg, google = artifacts_list
		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			version=pkg[0],
			test_version=google[0],
			github_user=github_list[0][0],
			github_repo=github_list[0][1],
			test_repo=github_list[1][1],
			artifacts=[hub.pkgtools.ebuild.Artifact(url=pkg[2], final_name=pkg[1]),
						hub.pkgtools.ebuild.Artifact(url=google[2], final_name=google[1])]
		)
		ebuild.push()

# vim: ts=4 sw=4 noet
