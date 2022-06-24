# Copyright 2013-2021 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack import *


class Argtable3(CMakePackage):
    """A single-file, ANSI C, command-line parsing library that parses GNU-style command-line options."""

    homepage = "https://www.argtable.org"
    url      = "https://github.com/jvanhare/argtable3/archive/refs/tags/v3.2.2.tar.gz"

    version('3.2.2', sha256='936abec19e04cb76769bfe9688f83af3a30fb99472bbdc6b177f282c826b738c')

    variant('shared',     default=True,      description='Build a shared version of the library')
    variant('build_type', default='Release', description='The build type to build', values=('Debug', 'Release', 'RelWithDebInfo', 'MinSizeRel'))

    def cmake_args(self):
        args = []
        if '+shared' in self.spec:
            args.append("-DBUILD_SHARED_LIBS=ON")
        return args
