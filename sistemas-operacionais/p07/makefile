CFLAGS = -Wall 
DEBUG = -DDEBUG -g

all: ppos* queue.* pingpong*
	gcc $(CFLAGS) ppos_core.c queue.c pingpong-contab.c -o teste-contab
	gcc $(CFLAGS) ppos_core.c queue.c pingpong-contab-prio.c -o teste-contab-prio


debug: ppos* queue.* pingpong*
	gcc $(CFLAGS) $(DEBUG) ppos_core.c queue.c pingpong-contab.c -o teste-contab
	gcc $(CFLAGS) $(DEBUG) ppos_core.c queue.c pingpong-contab-prio.c -o teste-contab-prio


diff1:
	diff out.txt saida1.txt


diff2:
	diff out.txt saida2.txt


clean:
	rm -rf *.o
	rm -rf out.txt


purge: clean
	rm -rf teste*