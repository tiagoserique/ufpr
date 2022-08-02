CFLAGS = -Wall 
DEBUG = -DDEBUG -g

all: ppos* queue.* pingpong*
	gcc $(CFLAGS) ppos_core.c queue.c pingpong-join.c -o teste


debug: ppos* queue.* pingpong*
	gcc $(CFLAGS) $(DEBUG) ppos_core.c queue.c pingpong-join.c -o teste


diff:
	diff out.txt saida.txt


clean:
	rm -rf *.o
	rm -rf out.txt


purge: clean
	rm -rf teste*