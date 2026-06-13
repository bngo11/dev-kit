#!/usr/bin/env python3

import json


async def generate(hub, **pkginfo):
	github_user = "KhronosGroup"
	github_repo = "SPIRV-LLVM-Translator"
	app = pkginfo["name"]
	basever = '22'
	url = version = None
	json_list = await hub.pkgtools.fetch.get_page(
		f"https://api.github.com/repos/{github_user}/{github_repo}/releases", is_json=True
	)
	for release in json_list:
		try:
			if release["prerelease"] or release["draft"]:
				continue
			version = release["tag_name"].lstrip("v")
			verlist = version.split('.')
			list(map(int, verlist))
			if verlist[0] != basever:
				continue
			url = release["tarball_url"]
			break
		except:
			continue
	if url and version:
		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			version=version,
			github_user=github_user,
			github_repo=github_repo,
			artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=f"{app}-{version}.tar.gz")],
		)
		ebuild.push()


# vim: ts=4 sw=4 noet
