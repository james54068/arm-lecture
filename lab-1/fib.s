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
	push {r3, r4, r5, lr}

	sub  r0, r0, #0

	@if (r0 <= 0) goto .L3
	cmp  r0, #0   @r4 = r0 - 0
	ble .L3

	@if (r4 == 1) goto .L4
	cmp r0, #1
	beq .L4

	sub  r0, r0, #0
	@variable
	mov r3, #0
	mov r4, #1


	@while loop
		Recursive:
		add r5, r3, r4
		mov r3, r4
		mov r4, r5
		sub r0, r0, #1
		cmp r0, #1
		bgt Recursive

	@return ro
	mov r0, r5 


	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
