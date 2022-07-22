CFLAGS = -Wall 
DEBUG = -DDEBUG -g
objects = pingpong-preempcao.o queue.o


all: ppos_core.o $(objects)
	gcc $(CFLAGS) ppos_core.o $(objects) -o teste


ppos_core.o: ppos_core.c ppos.h ppos_data.h 
	gcc $(CFLAGS) -c ppos_core.c


debug: ppos_core_debug.o $(objects)
	gcc $(CFLAGS) ppos_core_debug.o $(objects) -o teste


ppos_core_debug.o: ppos_core.c ppos.h ppos_data.h
	gcc $(CFLAGS) $(DEBUG) -c ppos_core.c -o ppos_core_debug.o


pingpong-preempcao.o: pingpong-preempcao.c 
	gcc $(CFLAGS) -c pingpong-preempcao.c


queue.o: queue.c queue.h 
	gcc $(CFLAGS) -c queue.c


diff:
	diff out.txt saida.txt


clean:
	rm -rf *.o
	rm -rf out.txt


purge: clean
	rm -rf teste*