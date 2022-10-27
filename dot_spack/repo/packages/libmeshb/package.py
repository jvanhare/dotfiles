# Copyright 2013-2020 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack import *


class Libmeshb(CMakePackage):
    """LibMeshb is a library to handle the *.meshb file format."""

    homepage = "https://github.com/jvanhare/libMeshb"
    git      = "https://github.com/jvanhare/libMeshb.git"

    version('7.62.4', tag='v7.62.4')

    variant('shared',     default=True,      description='Build a shared version of the library')
    variant('aio',        default=False,     description='Use Unix low-level and asynchronous I/O for higher speed')
    variant('build_type', default='Release', description='The build type to build', values=('Debug', 'Release', 'RelWithDebInfo', 'MinSizeRel'))
    
    def cmake_args(self):
        args = []
        if '+shared' in self.spec:
            args.append("-DBUILD_SHARED_LIBS=ON")
        if "+aio" in self.spec:
            args.append("-DWITH_AIO=ON")
        return args
