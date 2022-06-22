# Copyright 2013-2021 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack import *


class Tomlc99(MakefilePackage):
    """TOML in c99; v0.4.0 compliant."""

    homepage = "https://github.com/jvanhare/tomlc99"
    url      = "https://github.com/jvanhare/tomlc99/archive/refs/tags/v1.0.0.tar.gz"

    version('1.0.0', sha256='cc2d7525592d4ed2dea7d9f9afddb79d11f0042d7f8b93700b0ad1322001c198')

    variant('debug', default=False, description="Build with debug enabled.")

    def install(self, spec, prefix):
        make_args = []
        if spec.satisfies("+debug"):
            make_args.append("DEBUG=1")

        make(*make_args)
        make('prefix={0}'.format(prefix), 'install')
