CFLAGS = -Wall 
DEBUG  = -DDEBUG -g
LIBS   = -lm -lrt


all: disco1

disco1: ppos* queue.* pingpong*
	gcc $(CFLAGS) ppos_core.c queue.c ppos_disk.c disk.c pingpong-disco1.c -o teste $(LIBS)


disco2: ppos* queue.* pingpong*
	gcc $(CFLAGS) ppos_core.c queue.c ppos_disk.c disk.c pingpong-disco2.c -o teste $(LIBS)


debug1: ppos* queue.* pingpong*
	gcc $(CFLAGS) $(DEBUG) ppos_core.c queue.c ppos_disk.c disk.c pingpong-disco1.c -o teste $(LIBS)


debug2: ppos* queue.* pingpong*
	gcc $(CFLAGS) $(DEBUG) ppos_core.c queue.c ppos_disk.c disk.c pingpong-disco2.c -o teste $(LIBS)


clean:
	rm -rf *.o
	rm -rf out.txt


purge: clean
	rm -rf teste*