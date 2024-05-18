from conan import ConanFile

class ConanPracticeRecipe(ConanFile):
        settings = "os", "compiler", "build_type", "arch"
        generators = "PremakeDeps"

        def requirements(self):
                self.requires("spdlog/1.14.1")