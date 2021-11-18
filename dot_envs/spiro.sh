# Set spiro's environment. #####################################################
# Get ONERA's environment. #####################################################
source $HOME/.envs/onera.sh
# Path configuration. ##########################################################
export PATH=$WKDIR/spiro/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export LD_LIBRARY_PATH=$WKDIR/spiro/lib:$LD_LIBRARY_PATH
# Source spack. ################################################################
test -d $SRC/spack && source $SRC/spack/share/spack/setup-env.sh
# EOF. #########################################################################



# # Development environments.
# source_dev_intel_19_0_2() {
#     # Modules settings.
#     module purge
#     module load impi/19
#     module load intel/19.0.2
#     module load python/3.7.4-intel-19
#     module load hdf5/1.10.5-intel-19.impi-19
#     # Python virtualenvs settings.
#     export WORKON_HOME=$HOME/.virtualenvs
#     export VIRTUALENVWRAPPER_PYTHON=python3
#     source $HOME/.local/bin/virtualenvwrapper.sh
#     workon base
# }

# # CEDRE environments.
# source_cedre_dev_intel_19_0_2() {
#     source_dev_intel_19_0_2
#     export PDM_DIR=$WKDIR/spiro
#     export PCEDRE=$HOME/ccm_wa/cedre/P_CEDRE~$USER/P_CEDRE
#     export CL_LICENSE_FILE=$HOME/ccm_wa/cedre/P_CEDRE~$USER/P_CEDRE/PRIVE/CLE_CEDRE
#     export CEDRE_CLE_PATH=$HOME/ccm_wa/cedre/P_CEDRE~$USER/P_CEDRE/CEDRE/LIBRAIRIES/LIBCLE/MOLOCH/libcle.a
# }

# source_cedre_8_1_0_3() {
#     module purge
#     module use /stck/cedre/module/chaine_cedre
#     module load cedre/8.1.0.3/intel17_impi17
# }



# cat /stck/jvanhare/env/cedre_intel_17.sh 
# module purge

# # Use CEDRE tools chain.
# module use /stck/cedre/module/chaine_cedre

# # Load modules.
# module load cedre_dev
# module load cwipi
# module load hdf5/1.8.17-intel-17.impi
# module load cgns/3.2.1-intel-17

# # Export variables.
# export PATH=$HOME/bin:$PATH
# export PATH=/usr/local/bin:$PATH
# export PARMETIS_DIR=$HOME
# export SCOTCH_DIR=$HOME
# export PTSCOTCH_DIR=$HOME
# export PDM_DIR=$HOME
# unset CGNS_ROOT

# # Python environment.
# module load python/3.6.1-intel-17
# export PYTHON_LIBRARY=$PYTHON_LIBRARY_DIR/libpython3.6m.so
# export PYTHON_INCLUDE_DIR=$PYTHON_INCLUDE_DIR/python3.6m
# export PYTHONPATH=/stck/jvanhare/lib64:$PYTHONPATH
# export PYTHONPATH=$HOME/.local/lib/python3.6/site-packages:$PYTHONPATH

# # Python virtual environment.
# export WORKON_HOME=$HOME/.virtualenvs
# export VIRTUALENVWRAPPER_PYTHON=python3
# source $HOME/.local/bin/virtualenvwrapper.sh
# workon python@3.6.1

# # EOF

# cat /stck/jvanhare/env/intel_17.sh      
# module purge

# # Load Intel compilers.
# module load gcc/5.2
# module load intel/17.0.4
# module load impi/17
# module load cmake/3.19-gnu

# # Python environment.
# module load python/3.6.1-intel-17
# export PYTHON_LIBRARY=$PYTHON_LIBRARY_DIR/libpython3.6m.so
# export PYTHON_INCLUDE_DIR=$PYTHON_INCLUDE_DIR/python3.6m
# export PYTHONPATH=/stck/jvanhare/lib64:$PYTHONPATH
# export PYTHONPATH=$HOME/.local/lib/python3.6/site-packages:$PYTHONPATH

# # Python virtual environment.
# export WORKON_HOME=$HOME/.virtualenvs
# export VIRTUALENVWRAPPER_PYTHON=python3
# source $HOME/.local/bin/virtualenvwrapper.sh
# workon python@3.6.1

# # EOF.


# cat xl_12.sh 
# module purge
# module load gcc/4.9
# module load xl/12.0
# module load openmpi/1.8.2-xlc

# export FC=xlf2003_r
# export CC=xlc_r
# export CXX=xlc++_r


# cat cedre_xl_12.sh 
# source $HOME/env/xl_12.sh
# export PCEDRE=/stck/jvanhare/src/cedre/P_CEDRE
# export CEDRE_CLE_PATH=${PCEDRE}/CEDRE/LIBRAIRIES/LIBCLE/TANIT/libcle.a

# # External libraries paths.
# unset HDF5_ROOT
# unset ZLIB_ROOT
# # export SCOTCH_DIR=/stck/cedre/bib_ext_cedre/install/scotch_6.0.4/linux_pw7_tanit_openmpi
# # export PTSCOTCH_DIR=$SCOTCH_DIR
# export HDF5_DIR=/stck4/stck4.3/cedre/opt/hdf5-1.10.0-patch1/linux_ppc7_tanit
# export ZLIB_DIR=/stck4/stck4.3/cedre/opt/hdf5-1.10.0-patch1/linux_ppc7_tanit
# export CGNS_DIR=/stck4/stck4.3/cedre/opt/cgns_3.2.1/linux_ppc7_tanit
# export PDM_DIR=/stck/cedre/opt/base_pdm/1.11.2/install_tanit2_xl151
