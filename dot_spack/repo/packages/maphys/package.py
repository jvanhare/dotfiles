##############################################################################
# Copyright (c) 2013-2016, Lawrence Livermore National Security, LLC.
# Produced at the Lawrence Livermore National Laboratory.
#
# This file is part of Spack.
# Created by Todd Gamblin, tgamblin@llnl.gov, All rights reserved.
# LLNL-CODE-647188
#
# For details, see https://github.com/llnl/spack
# Please also see the NOTICE and LICENSE files for our notice and the LGPL.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License (as
# published by the Free Software Foundation) version 2.1, February 1999.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the IMPLIED WARRANTY OF
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the terms and
# conditions of the GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
##############################################################################
#
# This is a template package file for Spack.  We've put "FIXME"
# next to all the things you'll want to change. Once you've handled
# them, you can save this file and test your package like this:
#
#     spack install maphys
#
# You can edit this file again by typing:
#
#     spack edit maphys
#
# See the Spack documentation for more information on packaging.
# If you submit this package back to Spack as a pull request,
# please first remove this boilerplate and all FIXME comments.
#
from spack import *

class Maphys(CMakePackage):
    """a Massively Parallel Hybrid Solver."""

    homepage = "https://gitlab.inria.fr/solverstack/maphys/maphys"
    url      = homepage
    git      = url + ".git"

    version('master' , branch='master', submodules=True)
    version('develop', branch='develop', submodules=True)

    version('1.0', '4e524e28402d81511e322636e1fc6c72',
            url='http://morse.gforge.inria.fr/maphys/maphys-1.0.0.tar.gz', preferred=True)
    version('0.9.8.3', 'ef69636b625b93feac689aed7d5f7b61',
            url='http://morse.gforge.inria.fr/maphys/maphys-0.9.8.3.tar.gz')
    version('0.9.8.2', 'ce7ac8c8b5ccea039185b864b4dbc3bc',
            url='http://morse.gforge.inria.fr/maphys/maphys-0.9.8.2.tar.gz')
    version('0.9.8.1', '4cc896e0d7a9f1432c71108eb9f9e86c',
            url='http://morse.gforge.inria.fr/maphys/maphys-0.9.8.1.tar.gz')
    version('0.9.8', '1fb375fddb94ccc5d5ad6975bd067be1',
            url='http://morse.gforge.inria.fr/maphys/maphys-0.9.8.0.tar.gz')
    version('0.9.7', '38d12fda64fb428b2924ccd66c589e1b',
            url='http://morse.gforge.inria.fr/maphys/maphys-0.9.7.0.tar.gz')
    version('0.9.6', '75b1587a17c70740e693c4ffe5d115cc',
            url='http://morse.gforge.inria.fr/maphys/maphys-0.9.6.0.tar.gz')
    version('0.9.6.0', '75b1587a17c70740e693c4ffe5d115cc',
            url='http://morse.gforge.inria.fr/maphys/maphys-0.9.6.0.tar.gz')
    version('0.9.5', '53289def2993d9882e724e3a659cd200',
            url='http://morse.gforge.inria.fr/maphys/maphys-0.9.5.1.tar.gz')
    version('0.9.5.1', '53289def2993d9882e724e3a659cd200',
            url='http://morse.gforge.inria.fr/maphys/maphys-0.9.5.1.tar.gz')
    version('0.9.5.0', '8bc00e6597ef5b780243a794c6f71700',
            url='http://morse.gforge.inria.fr/maphys/maphys-0.9.5.0.tar.gz')

    variant('shared', default=True, description='Build MaPHyS as a shared library')
    variant('blasmt', default=False, description='Enable to use MPI+Threads version of MaPHyS, a multithreaded Blas/Lapack library is required (MKL, ESSL, OpenBLAS)')
    variant('mumps', default=True, description='Enable MUMPS direct solver')
    variant('pastix5', default=False, description='Enable PASTIX 5.2.3 direct solver')
    variant('pastix', default=False, description='Enable PASTIX 6.0.0 direct solver')
    variant('examples', default=True, description='Enable compilation and installation of example executables')
    variant('fabulous', default=False, description='Enable FABuLOuS iterative solver')
    variant('paddle', default=True, description='Enable Paddle domain decomposer')

    depends_on("pkg-config", type='build')
    depends_on("cmake", type='build')
    depends_on("mpi")
    depends_on("hwloc")
    depends_on("blas")
    depends_on("lapack")
    depends_on("mumps+mpi", when='+mumps')
    depends_on("scotch~metis+mpi+esmumps", when='+mumps')
    depends_on("scotch~metis+mpi~esmumps", when='~mumps')
    depends_on("pastix+mpi~metis", when='+pastix')
    depends_on("pastix5@5.2.3+mpi~metis", when='+pastix5')
    depends_on("pastix5@5.2.3+blasmt+mpi~metis", when='+pastix5+blasmt')
    depends_on('fabulous@1.0+blasmt', when='+fabulous+blasmt')
    depends_on('fabulous@1.0~blasmt', when='+fabulous~blasmt')
    depends_on('paddle', when='+paddle')

    patch('mumps_openmp.patch')
    patch('pack_gmres.patch')
    patch('pack_cg.patch')
    patch('slatec.patch')

    def cmake_args(self):
        spec = self.spec

        args = []

        if spec.satisfies('+pastix+pastix5'):
            raise RuntimeError('+pastix+pastix5: Pastix@6: and Pastix@5 are incompatible. Choose only one.')

        args.extend([
            "-Wno-dev",
            "-DCMAKE_COLOR_MAKEFILE:BOOL=ON",
            "-DCMAKE_VERBOSE_MAKEFILE:BOOL=ON",

            "-DBUILD_SHARED_LIBS=%s"     % ('ON' if spec.satisfies('+shared'  ) else 'OFF'),
            "-DMAPHYS_BUILD_EXAMPLES=%s" % ('ON' if spec.satisfies('+examples') else 'OFF'),
            "-DMAPHYS_BUILD_TESTS=%s"    % ('ON' if spec.satisfies('+examples') else 'OFF'),
            "-DMAPHYS_SDS_MUMPS=%s"      % ('ON' if spec.satisfies('+mumps'   ) else 'OFF'),
            "-DMAPHYS_BLASMT=%s"         % ('ON' if spec.satisfies('+blasmt'  ) else 'OFF'),
            "-DMAPHYS_SDS_PASTIX=%s"     % ('ON' if (spec.satisfies('+pastix')
                                                     or spec.satisfies('+pastix5')) else 'OFF'),
            "-DPASTIX_VER_6=%s"          % ('OFF' if spec.satisfies('+pastix5'  ) else 'ON'),
            ])

        if '^atlas' in spec:
            raise InstallError('MaPHyS with ATLAS has never been tested.')
        #args.extend(["-DBLA_VENDOR=ATLAS"])
        elif '^intel-mkl' in spec or '^intel-parallel-studio+mkl' in spec:
            if '^intel-mkl threads=none' in spec or '^intel-parallel-studio threads=none' in spec:
                args.extend(["-DBLA_VENDOR=Intel10_64lp_seq"])
            else:
                args.extend(["-DBLA_VENDOR=Intel10_64lp"])
        elif '^netlib-lapack' in spec:
            args.extend(["-DBLA_VENDOR=Generic"])
        elif '^veclibfort' in spec:
            raise InstallError('MaPHyS with veclibfort has never been tested.')

        ### Exeperimental MaPHyS features

        # Fabulous
        if spec.satisfies('+fabulous'):

            args.extend(["-DCMAKE_EXE_LINKER_FLAGS=-lstdc++"])
            args.extend(["-DMAPHYS_ITE_FABULOUS=ON"])
            args.extend(["-DFABULOUS_DIR=%s" % spec['fabulous'].prefix])

        # Paddle
        if spec.satisfies('+paddle'):
            args.extend(["-DMAPHYS_ORDERING_PADDLE=ON"])
            paddle_lib = spec['paddle'].libs.ld_flags
            paddle_inc = spec['paddle'].prefix.include + ";" + spec['paddle'].prefix.modules
            args.extend(["-DPADDLE_INCLUDE_DIRS=%s" % paddle_inc])
            args.extend(["-DPADDLE_LIBRARIES=%s" % paddle_lib])

        return args
