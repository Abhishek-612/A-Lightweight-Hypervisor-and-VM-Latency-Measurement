# Remember to rename this file to "guest.S" since Makefile uses this name.

# Multiply 2 matrices
 .text

matrix_a:
        .long 1, 2, 3, 4
matrix_b:
        .long 5, 6, 7, 8

matrix_c:
        .long 0, 0, 0, 0

.globl guest_code
guest_code:
        movq matrix_a, %rax
        movdqu (%rax), %xmm0
        movdqu 16(%rax), %xmm1

        movq matrix_b, %rax
        movdqu (%rax), %xmm2
        movdqu 16(%rax), %xmm3

        movdqa %xmm0, %xmm4
        pshufd $0x00, %xmm0, %xmm0
        pshufd $0x55, %xmm4, %xmm4
        pmuludq %xmm2, %xmm0
        pmuludq %xmm3, %xmm4
        paddd %xmm4, %xmm0
        movdqa %xmm0, %xmm4
        pshufd $0xff, %xmm0, %xmm0
        pshufd $0xaa, %xmm4, %xmm4
        pmuludq %xmm2, %xmm0
        pmuludq %xmm3, %xmm4
        paddd %xmm4, %xmm0

        movq matrix_c, %rax
        movdqu %xmm0, (%rax)

        ret
        .type guest_code @function