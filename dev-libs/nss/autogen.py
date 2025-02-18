#!/usr/bin/env python3

from bs4 import BeautifulSoup

async def generate(hub, **pkginfo):
	repos = ['nspr', 'nss']
	repo_info = []

	for repo in repos:
		html_data = await hub.pkgtools.fetch.get_page(f"https://hg.mozilla.org/projects/{repo}/")
		soup = BeautifulSoup(html_data, "html.parser")
		links = soup.find_all("a")
		version = None

		for link in links:
			href = link.get("href")
			if href and href.endswith("_RTM"):
				parts = href.split("/")
				version = parts[-1].lstrip(f"{repo.upper()}_").rstrip("_RTM").replace("_", ".")

				try:
					list(map(int, version.split(".")))
					repo_info.append((version, parts[-1]))
					break

				except ValueError:
					continue

	if repo_info:
		final_name = f"nss-{repo_info[1][0]}.tar.gz"
		url = f"https://ftp.mozilla.org/pub/security/nss/releases/{repo_info[1][1]}/src/{final_name}"
		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			version=repo_info[1][0],
			nspr_ver=repo_info[0][0],
			artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=final_name)],
		)

		ebuild.push()


# vim: ts=4 sw=4 noet
