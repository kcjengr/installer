from qtpyvcp._version import get_versions


def main():

    release_version = get_versions().get('version')[1:]
    return release_version


if __name__ == "__main__":
    main()
