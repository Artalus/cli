import os
from cpt.packager import ConanMultiPackager


if __name__ == "__main__":
    builder = ConanMultiPackager(
        # docker_build_options='--mount type=bind,source=$HOME/.conan/data,destination=/home/conan/.conan/data',

        username='daniele77',
        channel='ci',
        stable_branch_pattern='release/*',
        upload_only_when_stable=True,
        login_username='artalus',
        upload='https://api.bintray.com/conan/artalus/conan-public',
        remotes='https://api.bintray.com/conan/bincrafters/public-conan',
    )
    builder.add_common_builds()
    builder.run()
