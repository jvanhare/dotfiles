# Copyright 2013-2021 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack import *


class Argtable3(CMakePackage):
    """A single-file, ANSI C, command-line parsing library that parses GNU-style command-line options."""

    homepage = "https://www.argtable.org"
    git      = "https://github.com/argtable/argtable3.git"
    url      = "https://github.com/argtable/argtable3/releases/download/v3.2.1.52f24e5/argtable-v3.2.1.52f24e5.tar.gz"

    version('3.2.1.52f24e5', sha256='bf02394a21378fdca95937fc4e3aeff8af63a2bfed7e3f87b1c1eda8bf9227dc')

    variant('shared',     default=True,      description='Build a shared version of the library')
    variant('build_type', default='Release', description='The build type to build', values=('Debug', 'Release', 'RelWithDebInfo', 'MinSizeRel'))

    def cmake_args(self):
        args = []
        if '+shared' in self.spec:
            args.append("-DBUILD_SHARED_LIBS=ON")
        return args