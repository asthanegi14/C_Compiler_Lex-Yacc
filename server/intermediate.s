	.text
	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
.set @feat.00, 0
	.file	"temp.c"
	.def	main;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # -- Begin function main
.LCPI0_0:
	.long	0x40200000                      # float 2.5
	.text
	.globl	main
	.p2align	4, 0x90
main:                                   # @main
.seh_proc main
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	subq	$64, %rsp
	.seh_stackalloc 64
	leaq	64(%rsp), %rbp
	.seh_setframe %rbp, 64
	.seh_endprologue
	callq	__main
	movl	$0, -20(%rbp)
	movl	$1, -8(%rbp)
	movss	.LCPI0_0(%rip), %xmm0           # xmm0 = [2.5E+0,0.0E+0,0.0E+0,0.0E+0]
	movss	%xmm0, -16(%rbp)
	movb	$65, -1(%rbp)
	movl	$3, -12(%rbp)
	cvtsi2ssl	-12(%rbp), %xmm0
	movss	-16(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movsbl	-1(%rbp), %eax
	cvtsi2ss	%eax, %xmm2
	mulss	%xmm2, %xmm1
	addss	%xmm0, %xmm1
	cvttss2si	%xmm1, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edx
	leaq	.L.str(%rip), %rcx
	callq	printf
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbp
	retq
	.seh_endproc
                                        # -- End function
	.def	printf;
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90                         # -- Begin function printf
printf:                                 # @printf
.seh_proc printf
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movq	%r9, 88(%rsp)
	movq	%r8, 80(%rsp)
	movq	%rdx, 72(%rsp)
	movq	%rcx, 48(%rsp)
	leaq	72(%rsp), %rax
	movq	%rax, 40(%rsp)
	movq	__imp___acrt_iob_func(%rip), %rax
	movl	$1, %ecx
	callq	*%rax
	movq	48(%rsp), %rdx
	movq	40(%rsp), %r8
	movq	%rax, %rcx
	callq	__mingw_vfprintf
	movl	%eax, 36(%rsp)
	movl	36(%rsp), %eax
	addq	$56, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.section	.rdata,"dr"
.L.str:                                 # @.str
	.asciz	"value of i is = %d"

