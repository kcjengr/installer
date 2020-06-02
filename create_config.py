import os
import sys
from xml.etree import ElementTree

from qtpyvcp._version import get_versions


def main(args):

    main_url = "http://repository.qtpyvcp.com/main/repo/"
    dev_url = "http://repository.qtpyvcp.com/dev/repo/"

    in_config_file = args[1]
    out_config_file = args[2]

    url = args[3]

    tree = ElementTree.parse(in_config_file)
    root = tree.getroot()

    release_version = get_versions().get('version')[1:]
    os.environ["QTPYVCP_VERSION"] = release_version
    version_xml = root.find(".//Version")
    version_xml.text = release_version

    url_xml = root.find(".//Url")
    url_xml.text = url

    tree.write(out_config_file, encoding='utf-8', xml_declaration=True)


if __name__ == "__main__":
    main(sys.argv)
