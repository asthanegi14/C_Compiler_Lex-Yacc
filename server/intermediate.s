	.text
	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
.set @feat.00, 0
	.file	"temp.c"
	.def	insertion;
	.scl	2;
	.type	32;
	.endef
	.globl	insertion                       # -- Begin function insertion
	.p2align	4, 0x90
insertion:                              # @insertion
.seh_proc insertion
# %bb.0:
	subq	$24, %rsp
	.seh_stackalloc 24
	.seh_endprologue
	movq	%rcx, 8(%rsp)
	movl	%edx, 20(%rsp)
	movl	$1, 4(%rsp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movl	4(%rsp), %eax
	cmpl	20(%rsp), %eax
	jge	.LBB0_9
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	8(%rsp), %rax
	movslq	4(%rsp), %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, 16(%rsp)
	movl	4(%rsp), %eax
	subl	$1, %eax
	movl	%eax, (%rsp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorl	%eax, %eax
	cmpl	$0, (%rsp)
	jl	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movq	8(%rsp), %rax
	movslq	(%rsp), %rcx
	movl	(%rax,%rcx,4), %eax
	cmpl	16(%rsp), %eax
	setg	%al
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	testb	$1, %al
	jne	.LBB0_6
	jmp	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	movq	8(%rsp), %rax
	movslq	(%rsp), %rcx
	movl	(%rax,%rcx,4), %eax
	movq	8(%rsp), %rcx
	movl	(%rsp), %edx
	addl	$1, %edx
	movslq	%edx, %rdx
	movl	%eax, (%rcx,%rdx,4)
	movl	(%rsp), %eax
	subl	$1, %eax
	movl	%eax, (%rsp)
	jmp	.LBB0_3
.LBB0_7:                                #   in Loop: Header=BB0_1 Depth=1
	movl	16(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rsp), %edx
	addl	$1, %edx
	movslq	%edx, %rdx
	movl	%eax, (%rcx,%rdx,4)
# %bb.8:                                #   in Loop: Header=BB0_1 Depth=1
	movl	4(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 4(%rsp)
	jmp	.LBB0_1
.LBB0_9:
	addq	$24, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	printarray;
	.scl	2;
	.type	32;
	.endef
	.globl	printarray                      # -- Begin function printarray
	.p2align	4, 0x90
printarray:                             # @printarray
.seh_proc printarray
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movq	%rcx, 48(%rsp)
	movl	%edx, 44(%rsp)
	movl	$0, 40(%rsp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movl	40(%rsp), %eax
	cmpl	44(%rsp), %eax
	jge	.LBB1_4
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movq	48(%rsp), %rax
	movslq	40(%rsp), %rcx
	movl	(%rax,%rcx,4), %edx
	leaq	.L.str(%rip), %rcx
	callq	printf
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	movl	40(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 40(%rsp)
	jmp	.LBB1_1
.LBB1_4:
	addq	$56, %rsp
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
	.def	main;
	.scl	2;
	.type	32;
	.endef
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
main:                                   # @main
.seh_proc main
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	32(%rsp), %rbp
	.seh_setframe %rbp, 32
	.seh_endprologue
	subq	$32, %rsp
	callq	__main
	addq	$32, %rsp
	movl	$0, -4(%rbp)
	subq	$32, %rsp
	leaq	.L.str.1(%rip), %rcx
	callq	printf
	leaq	.L.str.2(%rip), %rcx
	leaq	4(%rbp), %rdx
	callq	scanf
	addq	$32, %rsp
	movl	4(%rbp), %ecx
	movq	%rsp, -16(%rbp)
	leaq	15(,%rcx,4), %rax
	andq	$-16, %rax
	callq	___chkstk_ms
	subq	%rax, %rsp
	movq	%rsp, %rsi
	movq	%rcx, -24(%rbp)
	subq	$32, %rsp
	leaq	.L.str.3(%rip), %rcx
	callq	printf
	addq	$32, %rsp
	movl	$0, (%rbp)
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	movl	(%rbp), %eax
	cmpl	4(%rbp), %eax
	jge	.LBB3_4
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	movslq	(%rbp), %rax
	shlq	$2, %rax
	movq	%rsi, %rdx
	addq	%rax, %rdx
	subq	$32, %rsp
	leaq	.L.str.2(%rip), %rcx
	callq	scanf
	addq	$32, %rsp
# %bb.3:                                #   in Loop: Header=BB3_1 Depth=1
	movl	(%rbp), %eax
	addl	$1, %eax
	movl	%eax, (%rbp)
	jmp	.LBB3_1
.LBB3_4:
	movl	4(%rbp), %edx
	subq	$32, %rsp
	movq	%rsi, %rcx
	callq	printarray
	leaq	.L.str.4(%rip), %rcx
	callq	printf
	addq	$32, %rsp
	movl	4(%rbp), %edx
	subq	$32, %rsp
	movq	%rsi, %rcx
	callq	insertion
	addq	$32, %rsp
	movl	4(%rbp), %edx
	subq	$32, %rsp
	movq	%rsi, %rcx
	callq	printarray
	addq	$32, %rsp
	movl	$0, -4(%rbp)
	movq	-16(%rbp), %rsp
	movl	-4(%rbp), %eax
	leaq	8(%rbp), %rsp
	popq	%rsi
	popq	%rbp
	retq
	.seh_endproc
                                        # -- End function
	.def	scanf;
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90                         # -- Begin function scanf
scanf:                                  # @scanf
.seh_proc scanf
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
	xorl	%ecx, %ecx
	callq	*%rax
	movq	48(%rsp), %rdx
	movq	40(%rsp), %r8
	movq	%rax, %rcx
	callq	__mingw_vfscanf
	movl	%eax, 36(%rsp)
	movl	36(%rsp), %eax
	addq	$56, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.section	.rdata,"dr"
.L.str:                                 # @.str
	.asciz	"%d "

.L.str.1:                               # @.str.1
	.asciz	"Enter the number of elements in the array: \n"

.L.str.2:                               # @.str.2
	.asciz	"%d"

.L.str.3:                               # @.str.3
	.asciz	"Enter the elements of the array: \n"

.L.str.4:                               # @.str.4
	.asciz	"\nSorted array: "

