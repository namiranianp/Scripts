#!/bin/bash

if [ ! -f "${SCRIPTS}/$1.sh" ]; then
    echo "${SCRIPTS}/$1.sh not found, creating file"
    echo "#!/bin/bash" > "${SCRIPTS}$1.sh"
fi
vim "${SCRIPTS}/$1.sh"

