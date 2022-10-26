# Copyright 2013-2022 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack.pkg.builtin.boost import Boost
from spack.spec import ConflictsInSpecError

yaml_cpp_tests_libcxx_error_msg = "yaml-cpp tests incompatible with libc++"


class YamlCpp(CMakePackage):
    """A YAML parser and emitter in C++"""

    homepage = "https://github.com/jvanhare/yaml-cpp"
    url = "https://github.com/jvanhare/yaml-cpp/archive/refs/tags/v0.7.0.tar.gz"
    git = "https://github.com/jvanhare/yaml-cpp.git"
    maintainers = ["jvanhare"]

    version(
        "0.7.0",
        sha256="a671aaf5847a29c3448590b659902777c7e345747ffb9e75a93cc8e604c445ab",
    )

    variant(
        "shared", default=True, description="Build shared instead of static libraries"
    )
    variant("pic", default=True, description="Build with position independent code")
    variant(
        "tests", default=False, description="Build yaml-cpp tests using internal gtest"
    )

    conflicts("%gcc@:4.7", when="@0.6.0:", msg="versions 0.6.0: require c++11 support")
    conflicts(
        "%clang@:3.3.0", when="@0.6.0:", msg="versions 0.6.0: require c++11 support"
    )
    conflicts(
        "%apple-clang@:4.0.0",
        when="@0.6.0:",
        msg="versions 0.6.0: require c++11 support",
    )
    conflicts(
        "%intel@:11.1", when="@0.6.0:", msg="versions 0.6.0: require c++11 support"
    )
    conflicts("%xl@:13.1", when="@0.6.0:", msg="versions 0.6.0: require c++11 support")
    conflicts(
        "%xl_r@:13.1", when="@0.6.0:", msg="versions 0.6.0: require c++11 support"
    )
    conflicts(
        '%clang cxxflags="-stdlib=libc++"',
        when="+tests",
        msg=yaml_cpp_tests_libcxx_error_msg,
    )

    def flag_handler(self, name, flags):
        # We cannot catch all conflicts with the conflicts directive because
        # the user can add arbitrary strings to the flags. Here we can at least
        # fail early.
        # We'll include cppflags in case users mistakenly put c++ flags there.
        spec = self.spec
        if name in ("cxxflags", "cppflags") and spec.satisfies("+tests"):
            if "-stdlib=libc++" in flags:
                raise ConflictsInSpecError(
                    spec,
                    [
                        (
                            spec,
                            spec.compiler_flags[name],
                            spec.variants["tests"],
                            yaml_cpp_tests_libcxx_error_msg,
                        )
                    ],
                )
        return (flags, None, None)

    def cmake_args(self):
        options = []

        options.extend(
            [
                self.define_from_variant("BUILD_SHARED_LIBS", "shared"),
                self.define_from_variant("YAML_BUILD_SHARED_LIBS", "shared"),
                self.define_from_variant("CMAKE_POSITION_INDEPENDENT_CODE", "pic"),
                self.define_from_variant("YAML_CPP_BUILD_TESTS", "tests"),
            ]
        )

        return options
