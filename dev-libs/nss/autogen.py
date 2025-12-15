#!/usr/bin/env python3

import requests
from bs4 import BeautifulSoup

async def generate(hub, **pkginfo):
	repos = [('nspr', '4.38'), ('nss', '3.110')]
	repo_info = {}

	for repo, ver in repos:
		html_data = await hub.pkgtools.fetch.get_page(f"https://hg.mozilla.org/projects/{repo}/")
		soup = BeautifulSoup(html_data, "html.parser")
		links = soup.find_all("a")
		version = None

		for link in links:
			href = link.get("href")
			if href and href.endswith("_RTM"):
				parts = href.split("/")
				pkgdir = parts[-1]
				version = pkgdir.lstrip(f"{repo.upper()}_").rstrip("_RTM")

				try:
					list(map(int, version.split("_")))
					if repo == 'nspr':
						for v in [version, version.replace("_", ".")]:
							res = requests.head(f"https://ftp.mozilla.org/pub/nspr/releases/v{v}/")
							if res.status_code != 200:
								continue

							if ver:
								if v.replace("_", ".") < ver:
									continue

							for f in [f'nspr-{version}.tar.gz', f'nspr-{version.replace("_", ".")}.tar.gz']:
								res = requests.head(f"https://ftp.mozilla.org/pub/nspr/releases/v{v}/src/{f}")
								if res.status_code != 200:
									continue

								repo_info['nspr'] = (v, pkgdir, f)
								break
							if 'nspr' in repo_info:
								break
							else:
								continue
					else:
						for d in [pkgdir, pkgdir.replace("_", ".")]:
							res = requests.head(f"https://ftp.mozilla.org/pub/security/nss/releases/{d}/")
							if res.status_code != 200:
								continue

							for v in [version, version.replace("_", ".")]:
								tarball = f'nss-{v}.tar.gz'
								res = requests.head(f"https://ftp.mozilla.org/pub/security/nss/releases/{d}/src/{tarball}")
								if res.status_code != 200:
									continue

								if ver:
									if v.replace("_", ".") >= ver:
										repo_info['nss'] = (v, d, tarball)
										break
									else:
										continue
								repo_info['nss'] = (v, d, tarball)
								break
							if 'nss' in repo_info:
								break
							else:
								continue

				except ValueError:
					continue

				if repo in repo_info:
					break

		if {'nspr', 'nss'} <= repo_info.keys():
			break

	if {'nspr', 'nss'} <= repo_info.keys():
		nss_info = repo_info['nss']
		url = f"https://ftp.mozilla.org/pub/security/nss/releases/{nss_info[1]}/src/{nss_info[2]}"
		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			version=nss_info[0].replace("_", "."),
			nspr_ver=repo_info['nspr'][0],
			artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=nss_info[2].replace("_", "."))],
		)

		ebuild.push()


# vim: ts=4 sw=4 noet
