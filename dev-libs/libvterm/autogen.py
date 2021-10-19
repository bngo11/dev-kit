#!/usr/bin/env python3

import re
from packaging import version
from bs4 import BeautifulSoup


async def generate(hub, **pkginfo):
    name = pkginfo["name"]
    homepage_data = await hub.pkgtools.fetch.get_page(
        "http://www.leonerd.org.uk/code/libvterm/"
    )
    homepage_soup = BeautifulSoup(homepage_data, "html.parser")

    name_pattern = re.compile(f"({name}-(.*)\\.tar\\.gz)")

    link_matches = (
        name_pattern.match(link.get("href"))
        for link in homepage_soup.find_all("a", href=True)
    )

    valid_matches = (match.groups() for match in link_matches if match)
    release_matches = (match for match in valid_matches if "rc" not in match[1].lower())

    target_filename, target_version = max(
        release_matches, key=lambda match: version.parse(match[1])
    )

    ebuild = hub.pkgtools.ebuild.BreezyBuild(
        **pkginfo,
        version=target_version,
        artifacts=[
            hub.pkgtools.ebuild.Artifact(
                url=f"http://www.leonerd.org.uk/code/libvterm/{target_filename}"
            )
        ],
    )
    ebuild.push()

