#!/bin/bash

generate_make_file() {
    local module_name=$1

    cat <<EOL > Makefile
obj-m += ${module_name}.o

all:
$(printf '\t')make -C /lib/modules/\$(shell uname -r)/build M=\$(PWD) modules

clean:
$(printf '\t')make -C /lib/modules/\$(shell uname -r)/build M=\$(PWD) clean
EOL

    echo "Makefile for ${module_name} module has been created."
}