	.text
	.intel_syntax noprefix
	.file	"add4.c"
	.globl	add4_bench                      # -- Begin function add4_bench
	.p2align	4, 0x90
	.type	add4_bench,@function
add4_bench:                             # @add4_bench
# %bb.0:
	mov	r8, qword ptr [rip + arr1@GOTPCREL]
	mov	ecx, dword ptr [r8]
	mov	rdx, qword ptr [rip + arr2@GOTPCREL]
	mov	r10d, dword ptr [rdx]
	test	ecx, ecx
	js	.LBB0_1
# %bb.2:
	sub	ecx, r10d
	mov	r11d, dword ptr [rdx + 4]
	mov	r9d, dword ptr [rdx + 8]
	mov	esi, dword ptr [r8 + 4]
	mov	eax, dword ptr [r8 + 8]
	sub	esi, r11d
	sub	eax, r9d
	mov	edx, dword ptr [rdx + 12]
	mov	edi, dword ptr [r8 + 12]
	sub	edi, edx
	mov	dword ptr [r8 + 12], edi
	test	ecx, ecx
	js	.LBB0_4
.LBB0_5:
	sub	ecx, r10d
	sub	esi, r11d
	sub	eax, r9d
	sub	edi, edx
	test	ecx, ecx
	js	.LBB0_7
.LBB0_8:
	sub	ecx, r10d
	sub	esi, r11d
	sub	eax, r9d
	sub	edi, edx
	test	ecx, ecx
	js	.LBB0_10
.LBB0_11:
	sub	ecx, r10d
	mov	dword ptr [r8], ecx
	sub	esi, r11d
	mov	dword ptr [r8 + 4], esi
	sub	eax, r9d
	mov	dword ptr [r8 + 8], eax
	sub	edi, edx
	mov	dword ptr [r8 + 12], edi
	ret
.LBB0_1:
	add	ecx, r10d
	mov	r11d, dword ptr [rdx + 4]
	mov	r9d, dword ptr [rdx + 8]
	mov	esi, dword ptr [r8 + 4]
	add	esi, r11d
	mov	eax, dword ptr [r8 + 8]
	add	eax, r9d
	mov	edx, dword ptr [rdx + 12]
	mov	edi, dword ptr [r8 + 12]
	add	edi, edx
	mov	dword ptr [r8 + 12], edi
	test	ecx, ecx
	jns	.LBB0_5
.LBB0_4:
	add	ecx, r10d
	add	esi, r11d
	add	eax, r9d
	add	edi, edx
	test	ecx, ecx
	jns	.LBB0_8
.LBB0_7:
	add	ecx, r10d
	add	esi, r11d
	add	eax, r9d
	add	edi, edx
	test	ecx, ecx
	jns	.LBB0_11
.LBB0_10:
	add	ecx, r10d
	mov	dword ptr [r8], ecx
	add	esi, r11d
	mov	dword ptr [r8 + 4], esi
	add	eax, r9d
	mov	dword ptr [r8 + 8], eax
	add	edi, edx
	mov	dword ptr [r8 + 12], edi
	ret
.Lfunc_end0:
	.size	add4_bench, .Lfunc_end0-add4_bench
                                        # -- End function
	.globl	add4                            # -- Begin function add4
	.p2align	4, 0x90
	.type	add4,@function
add4:                                   # @add4
	.cfi_startproc
# %bb.0:
	mov	eax, dword ptr [rdi]
	mov	ecx, dword ptr [rsi]
	test	eax, eax
	js	.LBB1_1
# %bb.2:
	sub	eax, ecx
	mov	dword ptr [rdi], eax
	mov	eax, dword ptr [rsi + 4]
	sub	dword ptr [rdi + 4], eax
	mov	eax, dword ptr [rsi + 8]
	sub	dword ptr [rdi + 8], eax
	mov	eax, dword ptr [rsi + 12]
	sub	dword ptr [rdi + 12], eax
	ret
.LBB1_1:
	add	ecx, eax
	mov	dword ptr [rdi], ecx
	mov	eax, dword ptr [rsi + 4]
	add	dword ptr [rdi + 4], eax
	mov	eax, dword ptr [rsi + 8]
	add	dword ptr [rdi + 8], eax
	mov	eax, dword ptr [rsi + 12]
	add	dword ptr [rdi + 12], eax
	ret
.Lfunc_end1:
	.size	add4, .Lfunc_end1-add4
	.cfi_endproc
                                        # -- End function
	.type	arr1,@object                    # @arr1
	.bss
	.globl	arr1
	.p2align	2
arr1:
	.zero	16
	.size	arr1, 16

	.type	arr2,@object                    # @arr2
	.globl	arr2
	.p2align	2
arr2:
	.zero	16
	.size	arr2, 16

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
