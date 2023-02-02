# Copyright 2013-2022 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack import *


class Cjson(CMakePackage):
    """Ultralightweight JSON parser in ANSI C"""

    homepage = "https://github.com/DaveGamble/cJSON"
    url = "https://github.com/DaveGamble/cJSON/archive/refs/tags/v1.7.15.tar.gz"

    version("1.7.15", sha256="5308fd4bd90cef7aa060558514de6a1a4a0819974a26e6ed13973c5f624c24b2")

    variant('shared',     default=True,      description='Build a shared version of the library')
    variant('build_type', default='Release', description='The build type to build', values=('Debug', 'Release', 'RelWithDebInfo', 'MinSizeRel'))


    def cmake_args(self):
        args = []
        if '+shared' in self.spec:
            args.append("-DBUILD_SHARED_LIBS=ON")
        args.append("-DENABLE_CJSON_TEST=OFF")
        args.append("-DENABLE_CJSON_UTILS=OFF")
        args.append("-DCMAKE_MACOSX_RPATH=ON")
        return args
