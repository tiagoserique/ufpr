CFLAGS = -Wall 
DEBUG  = -DDEBUG -g
LIBS   = -lm -lrt


all: ppos* queue.* pingpong*
	gcc $(CFLAGS) ppos_core.c queue.c ppos_disk.c disk.c pingpong-disco.c -o teste $(LIBS)


debug: ppos* queue.* pingpong*
	gcc $(CFLAGS) $(DEBUG) ppos_core.c queue.c ppos_disk.c disk.c pingpong-disco.c -o teste $(LIBS)


clean:
	rm -rf *.o
	rm -rf out.txt


purge: clean
	rm -rf teste*