from conans import ConanFile, tools


class CliConan(ConanFile):
    name = "cli"
    version = "1.0.0"
    license = "BSL"
    author = "daniele77"
    url = "https://github.com/Artalus/cli"
    description = "A header-only library for interactive command line interfaces in modern C++"
    topics = ("cli", "terminal", "command line", "interactive", "interface", "c++14")
    # No settings are necessary, this is header only
    exports_sources = "cli/*"
    no_copy_source = True
    options = {
        "modular_boost": [True, False] # depend
    }
    default_options = { "modular_boost":True }
    scm = {"type": "git",
           "url": "auto",
           "revision": "1.0.0"
          }

    def package(self):
        self.copy("*.h", "include")

    def package_id(self):
        self.info.header_only()

    def requirements(self):
        if self.options.modular_boost:
            self.requires("boost_asio/[>=1.65.1]@bincrafters/stable")
        else:
            self.requires("boost/[>=1.64]@conan/stable")
