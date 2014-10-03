	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, r6, r7, lr}

	subs r4, r0, #0

	@if (r0 <= 0) goto .L3
	subs r4, r0, #0   @r4 = r0 - 0
	ble .L3

	@if (r4 == 1) goto .L4
	cmp r4, #1
	beq .L4


	sub r0, r4, #1 @; r0 = r4 + 4294967295 (or #0xFFFFFFFF)
	bl fibonacci @ goto fibonacci @PC relative address

	mov r5, r0 @ r5 = r0
	sub r0, r4, #2 @ r0 = r4 - 2

	bl fibonacci @ goto fibonacci @PC relative address

	add r0, r5, r0
	@return ro

	pop {r3, r4, r5, r6, r7, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
