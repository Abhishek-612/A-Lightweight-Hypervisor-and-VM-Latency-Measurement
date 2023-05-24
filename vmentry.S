#include "macro.h"

.text

.macro vmentry_prepare
        // save stack pointer
        mov     $VMCS_HOST_RSP, %rax
        vmwrite %rsp, %rax
.endm

.globl do_vmlaunch
do_vmlaunch:
        vmentry_prepare
        vmlaunch
        jmp entry_error

.globl do_vmresume
do_vmresume:
        vmentry_prepare
        vmresume
        /* fall through */

entry_error:
        mov $1, %rax
        jmp vmx_return

.globl vmx_exit
vmx_exit:
        xor %rax, %rax  /* return 0 */

vmx_return:
        ret

.type do_vmlaunch @function
.type do_vmresume @function
.type vmx_exit @function