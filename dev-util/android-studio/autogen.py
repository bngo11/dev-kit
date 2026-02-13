#!/usr/bin/env python3

from bs4 import BeautifulSoup

async def generate(hub, **pkginfo):
	html_data = await hub.pkgtools.fetch.get_page("https://developer.android.com/studio/")
	soup = BeautifulSoup(html_data, "html.parser")
	links = soup.find_all("a")
	version = None

	for link in links:
		url = link.get("href")
		if url and url.endswith("linux.tar.gz"):
			parts = url.split("/")
			version = parts[-2]

			try:
				list(map(int, version.split(".")))
				break

			except ValueError:
				continue

	if version:
		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			version=version,
			artifacts=[hub.pkgtools.ebuild.Artifact(url=url)],
		)

		ebuild.push()


# vim: ts=4 sw=4 noet
