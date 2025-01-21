#!/usr/bin/env python3

from metatools.version import generic

revision = { "2021.3.0" : 1 }
patches = [
	{
		# This fix will be in releases > 2021.3.0.
		"name"	   :  "tbb-2021.3.0-fix-getSmallObjectIndex-macros.patch",
		"issue"    :  "FL-8621",
		"desc"	   :  "Fixes arm-32bit builds.",
		"apply"    :  lambda v: v == "2021.3.0"
	},
	{
		# This patch is not yet in upstream tbb, so we will need to continue to apply it.
		"name"	   :  "tbb-2021.3.0-riscv.patch",
		"issue"    :  "FL-8615",
		"desc"	   :  "TODO",
		"apply"    :   lambda v: v == "2021.7.0"
	}
]

def get_release(release_data):
	version = None
	url = None

	for item in release_data:
		try:
			if item["prerelease"] or item["draft"]:
				continue

			version = item["tag_name"].strip("v")
			list(map(int, version.split(".")))

			url = item["tarball_url"]
			print(version, url)
			break

		except (KeyError, IndexError, ValueError) as error:
			print(error)
			continue

	return version, url

async def generate(hub, **pkginfo):
	user = "uxlfoundation"
	repo = "oneTBB"
	release_data = await hub.pkgtools.fetch.get_page(f"https://api.github.com/repos/{user}/{repo}/releases?page", is_json=True)
	version, url = get_release(release_data)
	if version is None:
		raise hub.pkgtools.ebuild.BreezyError(f"Can't find suitable release of {repo}")
	final_name = f"{pkginfo['name']}-{version}.tar.gz"

	active_patches = []
	for patch in patches:
		if patch["apply"](version):
			active_patches.append(patch)

	ebuild = hub.pkgtools.ebuild.BreezyBuild(
		**pkginfo,
		version=version,
		revision=revision[version] if version in revision else 0,
		github_user=user,
		github_repo=repo,
		artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=final_name)],
		patches=active_patches
	)
	ebuild.push()
