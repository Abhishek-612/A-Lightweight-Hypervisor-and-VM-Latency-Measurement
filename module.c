#include <linux/module.h>

#include "vmx.h"

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Abhishek R.");
MODULE_DESCRIPTION("vmlatency");

static int __init
vmlatency_init(void)
{
        if (!vmx_enabled())
                return 0;

        print_vmx_info();

        measure_vmlatency();
        return 0;
}

static void __exit
vmlatency_exit(void)
{
}

module_init(vmlatency_init);
module_exit(vmlatency_exit);