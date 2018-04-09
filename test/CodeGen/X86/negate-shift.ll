; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown | FileCheck %s --check-prefix=X64

define i32 @neg_lshr_signbit(i32 %x) {
; X64-LABEL: neg_lshr_signbit:
; X64:       # %bb.0:
; X64-NEXT:    sarl $31, %edi
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    retq
  %sh = lshr i32 %x, 31
  %neg = sub i32 0, %sh
  ret i32 %neg
}

define i64 @neg_ashr_signbit(i64 %x) {
; X64-LABEL: neg_ashr_signbit:
; X64:       # %bb.0:
; X64-NEXT:    shrq $63, %rdi
; X64-NEXT:    movq %rdi, %rax
; X64-NEXT:    retq
  %sh = ashr i64 %x, 63
  %neg = sub i64 0, %sh
  ret i64 %neg
}

define <4 x i32> @neg_ashr_signbit_vec(<4 x i32> %x) {
; X64-LABEL: neg_ashr_signbit_vec:
; X64:       # %bb.0:
; X64-NEXT:    psrld $31, %xmm0
; X64-NEXT:    retq
  %sh = ashr <4 x i32> %x, <i32 31, i32 31, i32 31, i32 31>
  %neg = sub <4 x i32> zeroinitializer, %sh
  ret <4 x i32> %neg
}

define <8 x i16> @neg_lshr_signbit_vec(<8 x i16> %x) {
; X64-LABEL: neg_lshr_signbit_vec:
; X64:       # %bb.0:
; X64-NEXT:    psraw $15, %xmm0
; X64-NEXT:    retq
  %sh = lshr <8 x i16> %x, <i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15>
  %neg = sub <8 x i16> zeroinitializer, %sh
  ret <8 x i16> %neg
}

