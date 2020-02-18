import sys
import git
from xml.etree import ElementTree


def main(args):

    print(args)

    in_config_file = args[1]
    out_config_file = args[2]

    tree = ElementTree.parse(in_config_file)
    root = tree.getroot()

    repo = git.Repo()
    sha = repo.head.object.hexsha

    # version_tag = next((tag for tag in repo.tags if tag.commit == repo.head.commit), None)
    version_tag = None
    for tag in repo.tags:
        version_tag = tag

    if version_tag:
        version = version_tag
        print(version)

        version_xml = root.find(".//Version")
        release_version = "{}_git{}".format(version, sha[:6])
        print(release_version)
        version_xml.text = release_version
        tree.write(out_config_file, encoding='utf-8', xml_declaration=True)


if __name__ == "__main__":
    main(sys.argv)
