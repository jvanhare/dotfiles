help([[Automatically generated module file. Do not edit.]])

setenv("LMOD_COLORIZE", "YES")

setenv("CC", "{{ (datasource "packages").env.cc }}")
setenv("CXX", "{{ (datasource "packages").env.cxx }}")
setenv("HPC_ENVIRONMENT", "{{ .Env.PWD | filepath.Base }}")

prepend_path("CMAKE_PREFIX_PATH", "{{ .Env.PWD }}")
prepend_path("LD_LIBRARY_PATH", "{{ .Env.PWD }}/lib")
prepend_path("DYLD_LIBRARY_PATH", "{{ .Env.PWD }}/lib")
prepend_path("PKG_CONFIG_PATH", "{{ .Env.PWD }}/lib/pkgconfig")
prepend_path("PATH", "{{ .Env.PWD }}/bin")
