# Copyright 2013-2020 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack import *


class Libmeshb(CMakePackage):
    """LibMeshb is a library to handle the *.meshb file format."""

    homepage = "https://github.com/LoicMarechal/libMeshb"
    url      = "https://github.com/jvanhare/libMeshb/archive/refs/tags/v7.62.0.tar.gz"

    version('7.62.2', sha256='462a6bd81765629162a9620ac5e0bb2b88a0a355ba365da23e06433db5f1f959')
    version('7.62.1', sha256='dbaa2915e12fb3d413531557ed0967bf4b144c5ab0a6e81afec6337d8b49c39a')
    version('7.62.0', sha256='3f71afe0166a1cb936a0e8951f437643d2a2075744be580e5bdf40b24807ba84')

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
