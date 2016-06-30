.text
.set noreorder
.set noat


# a0 should contain a pointer to the thread struct we are switching from
# a1 should contain a pointer to the thread struct we are switching to

.global context_switch
context_switch:
	# Store CPU state in thread struct
	sw $v0, 0($a0)
	sw $v1, 4($a0)
	sw $a0, 8($a0)
	sw $a1, 12($a0)
	sw $a2, 16($a0)
	sw $t0, 20($a0)
	sw $t1, 24($a0)
	sw $t2, 28($a0)
	sw $t3, 32($a0)
	sw $t4, 36($a0)
	sw $t5, 40($a0)
	sw $t6, 44($a0)
	sw $t7, 48($a0)
	sw $t8, 52($a0)
	sw $t9, 56($a0)
	sw $s0, 60($a0)
	sw $s1, 64($a0)
	sw $s2, 68($a0)
	sw $s3, 72($a0)
	sw $s4, 76($a0)
	sw $s5, 80($a0)
	sw $s6, 84($a0)
	sw $s7, 88($a0)
	sw $k0, 92($a0)
	sw $k1, 96($a0)
	sw $gp, 100($a0)
	sw $sp, 104($a0)
	sw $fp, 108($a0)
	sw $ra, 112($a0)
	sw $HI, 116($a0)
	sw $LO, 120($a0)
	sw $PC, 124($a0)

	# Restore CPU state from thread struct




