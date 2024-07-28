#!/bin/bash

generate_c_file() {
	local module_name=$1

	cat << EOL > ${module_name}.c
	#include <linux/module.h>
	#include <linux/kernel.h>
	#include <linux/init.h>

static int __init ${module_name}_init(void) {
return 0;
}

static void __exit ${module_name}_exit(void) {
}

module_init(${module_name}_init);
module_exit(${module_name}_exit);

MODULE_LICENSE("GPL");
MODULE_VERSION("1.0");
EOL
echo " C file{module_name}.c has been created. "

}
