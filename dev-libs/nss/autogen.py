#!/usr/bin/env python3

from bs4 import BeautifulSoup

async def generate(hub, **pkginfo):
	repo = 'nss'
	ver = '3.109'
	repo_info = []

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
				if ver:
					if version >= ver:
						repo_info.append((version, parts[-1]))
						break
					else:
						continue
				repo_info.append((version, parts[-1]))
				break

			except ValueError:
				continue

	if repo_info:
		final_name = f"nss-{repo_info[0][0]}.tar.gz"
		url = f"https://ftp.mozilla.org/pub/security/nss/releases/{repo_info[0][1]}/src/{final_name}"
		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			version=repo_info[0][0],
			artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=final_name)],
		)

		ebuild.push()


# vim: ts=4 sw=4 noet
