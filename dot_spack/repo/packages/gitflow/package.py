# Copyright 2013-2021 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack import *


class Gitflow(MakefilePackage):
    """Git extensions to provide high-level repository operations for Vincent Driessen's branching model."""

    homepage = "https://nvie.com/posts/a-successful-git-branching-model/"
    git = "https://github.com/nvie/gitflow.git"
    url = "https://github.com/nvie/gitflow/archive/refs/tags/0.4.1.tar.gz"

    version("last", commit="15aab26490facf285acef56cb5d61025eacb3a69", submodules=True)

    def edit(self, spec, prefix):
        makefile = FileFilter("Makefile")
        makefile.filter("prefix=/usr/local", "prefix=" + prefix)
