	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW


         STMDB sp!, {r1, r2}

	@assign locked=1 into r1
 	ldr r1, =locked

 	@ r0 is mutexlock | locked, 1 | unlocked, 0

 	check_lock:
 	@Load mutexlock value from r0 to r2
 	ldrex r2, [r0]
 	@ldr    r2, [r0]
 	@check if mutexlock is unlocked(compare r2 with 0)
 	cmp r2, #0
 	@if mutexlock is unlocked store r1 into r0(change status from unlocked to locked)
 	@r2 = 0 if successful or 1 if unsuccessful
	@strex = save r1 into r0
 	strexeq r2, r1, [r0]
 	@streq      r1, [r0]
 	@check lock status
 	cmpeq r2, #0
 	@Branch if not equal
 	@cmp r2, #0
 	bne check_lock 

    @ END CODE INSERT

    LDMIA sp!, {r1, r2}
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
	
	STMDB sp!, {r1, r2}

 	@ r0 is mutexlock | locked, 1 | unlocked, 0

 	@assign unlocked=0 into r1
 	ldr r1, =unlocked
 	@store r1 into r0
 	str r1, [r0]
 	@return r0 = unlocked = 0 

	
        
        @ END CODE INSERT
    LDMIA sp!, {r1, r2}
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
