# Set freyja's environment. ####################################################
{{ template "export.darwin.tmpl" . }}
# Aliases. #####################################################################
alias ls="ls -ltrGh"
# Source spack and lmod. #######################################################
test -d $SRC/spack && source $SRC/spack/share/spack/setup-env.sh
source /usr/local/opt/lmod/init/sh
# EOF. #########################################################################
