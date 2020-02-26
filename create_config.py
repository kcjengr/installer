import sys
import git
from xml.etree import ElementTree


def main(args):

    in_config_file = args[1]
    out_config_file = args[2]

    tree = ElementTree.parse(in_config_file)
    root = tree.getroot()

    repo = git.Repo()

    release_version = repo.git.describe('--tags', '--always', '--long')[1:]
    version_xml = root.find(".//Version")
    version_xml.text = release_version
    tree.write(out_config_file, encoding='utf-8', xml_declaration=True)


if __name__ == "__main__":
    main(sys.argv)
