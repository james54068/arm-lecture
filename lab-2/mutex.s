	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW

 	ldr r1, =locked			@assign locked=1 into r1
 							@ r0 is mutexlock | locked, 1 | unlocked, 0
 check_lock: 	
 	ldrex r2, [r0]			@Load mutexlock value from r0 to r2
 							@ldr    r2, [r0]
 							@check if mutexlock is unlocked(compare r2 with 0)
 	cmp r2, #0				@check if lock is free 					          
 	strexeq r2, r1, [r0]	@if mutexlock is unlocked store r1 into r0(change status from unlocked to locked)	
 							@r2 = 0 if successful(no memory) or 1 if unsuccessful
 							@strex = save r1 into r0 		
 	cmpeq r2, #0			@check lock status	
 	bne check_lock 
 	dmb
 	bx lr

    @ END CODE INSERT
	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
	
 	@ r0 is mutexlock | locked, 1 | unlocked, 0

 	ldr r1, =unlocked
 	dmb
 	str r1,[r0]	
 	@check_unlock:
 	@assign unlocked=0 into r1
 	@ldrex r2, [r0]
 	@strex r2, r1, [r0]
 	@cmpeq r2, #0
 	@bne check_unlock
 	bx lr

 	@return r0 = unlocked = 0 
      
    @ END CODE INSERT
	
	.size unlock_mutex, .-unlock_mutex

	.end
