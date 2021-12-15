module purge
CWD=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source $CWD/loads

module load gcc/8.3

# EOF.
