#!/usr/bin/env python3

from metatools.version import generic


async def generate(hub, **pkginfo):
	github_user = "dandavison"
	github_repo = "delta"

	release_data = await hub.pkgtools.fetch.get_page(
		f"https://api.github.com/repos/{github_user}/{github_repo}/releases",
		is_json=True,
	)

	for item in release_data:
		try:
			if item["prerelease"] or item["draft"]:
				continue

			version = item["tag_name"]
			list(map(int, version.split(".")))
			source_url = item["tarball_url"]
			source_name = f"{github_repo}-{version}.tar.gz"
			break

		except (KeyError, IndexError, ValueError):
			continue

	source_artifact = hub.pkgtools.ebuild.Artifact(
		url=source_url, final_name=source_name
	)

	cargo_artifacts = await hub.pkgtools.rust.generate_crates_from_artifact(
		source_artifact
	)

	ebuild = hub.pkgtools.ebuild.BreezyBuild(
		**pkginfo,
		version=version,
		github_user=github_user,
		github_repo=github_repo,
		crates=cargo_artifacts["crates"],
		artifacts=[source_artifact, *cargo_artifacts["crates_artifacts"]],
	)
	ebuild.push()

