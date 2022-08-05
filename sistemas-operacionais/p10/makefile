CFLAGS = -Wall 
DEBUG = -DDEBUG -g

all: ppos* queue.* pingpong*
	gcc $(CFLAGS) ppos_core.c queue.c pingpong-semaphore.c -o teste-semaphore
	gcc $(CFLAGS) ppos_core.c queue.c pingpong-racecond.c -o teste-racecond


debug: ppos* queue.* pingpong*
	gcc $(CFLAGS) $(DEBUG) ppos_core.c queue.c pingpong-semaphore.c -o teste-semaphore
	gcc $(CFLAGS) $(DEBUG) ppos_core.c queue.c pingpong-racecond.c -o teste-racecond


diff-s:
	diff out.txt semaphore.txt


diff-r:
	diff out.txt racecond.txt


clean:
	rm -rf *.o
	rm -rf out.txt


purge: clean
	rm -rf teste*