help([[Automatically generated module file. Do not edit.]])

setenv("LMOD_COLORIZE", "YES")

setenv("CC", "{{ (datasource "packages").env.cc }}")
setenv("CXX", "{{ (datasource "packages").env.cxx }}")
setenv("HPC_ENVIRONMENT", "{{ .Env.PWD | filepath.Base }}")

setenv("PMIX_MCA_gds", "hash")
setenv("OMPI_MCA_btl", "vader,self")

setenv("CMAKE_GENERATOR", "Ninja")
setenv("CTEST_PARALLEL_LEVEL", "8")

setenv("MallocNanoZone", "0")
setenv("ASAN_OPTIONS", "detect_leaks=1")
setenv("LSAN_OPTIONS", "suppressions={{ .Env.PWD }}/lsan:print_suppressions=false")

prepend_path("CMAKE_PREFIX_PATH", "{{ .Env.PWD }}")
prepend_path("LD_LIBRARY_PATH", "{{ .Env.PWD }}/lib")
prepend_path("DYLD_LIBRARY_PATH", "{{ .Env.PWD }}/lib")
prepend_path("PKG_CONFIG_PATH", "{{ .Env.PWD }}/lib/pkgconfig")
prepend_path("PATH", "{{ .Env.PWD }}/bin")
