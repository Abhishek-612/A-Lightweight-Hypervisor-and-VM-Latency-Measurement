# Remember to rename this file to "guest.S" since Makefile uses this name.

# Add two numbers
.text

.globl guest_code
guest_code:
    	mov %rdi, %rax
    	add %rsi, %rax
    	mov %rax, %rdx
    	ret
    	.type guest_code @function