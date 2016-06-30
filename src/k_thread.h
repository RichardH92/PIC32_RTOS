#ifndef K_THREAD_H
#define K_THREAD_H

typedef tid_t unsigned int;
typedef reg unsigned int;

struct thread {
	reg v0;
	reg v1;
	reg a[3];
	reg t[10];
	reg s[8];
	reg k[2];
	reg global_ptr;
	reg stack_ptr;
	reg frame_ptr;
	reg ret_addr;
	reg hi;
	reg lo;
	reg prog_counter;

	char name[16];
	
	unsigned int magic = 0xDEADBEEF;
}

















#endif

