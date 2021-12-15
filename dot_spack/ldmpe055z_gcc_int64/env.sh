module purge
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source $SCRIPT_DIR/loads

module load gcc/8.3

# EOF.

