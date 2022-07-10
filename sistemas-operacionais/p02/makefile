CFLAGS = -Wall -std=c99
DEBUG = -DDEBUG -g
objects = pingpong-tasks1.o pingpong-tasks2.o pingpong-tasks3.o


all: ppos_core.o $(objects)
	gcc -Wall -Wextra ppos_core.o pingpong-tasks1.o -o teste1
	gcc -Wall -Wextra ppos_core.o pingpong-tasks2.o -o teste2
	gcc -Wall -Wextra ppos_core.o pingpong-tasks3.o -o teste3


debug: ppos_core_debug.o $(objects)
	gcc -Wall -Wextra ppos_core.o pingpong-tasks1.o -o teste1
	gcc -Wall -Wextra ppos_core.o pingpong-tasks2.o -o teste2
	gcc -Wall -Wextra ppos_core.o pingpong-tasks3.o -o teste3


ppos_core.o: ppos_core.c ppos.h ppos_data.h
	gcc $(CFLAGS) -c ppos_core.c


ppos_core_debug.o: ppos_core.c ppos.h ppos_data.h
	gcc $(CFLAGS) $(DEBUG) -c ppos_core.c


pingpong-tasks1.o: pingpong-tasks1.c 
	gcc $(CFLAGS) -c pingpong-tasks1.c


pingpong-tasks2.o: pingpong-tasks2.c 
	gcc $(CFLAGS) -c pingpong-tasks2.c


pingpong-tasks3.o: pingpong-tasks3.c 
	gcc $(CFLAGS) -c pingpong-tasks3.c


diff1:
	diff out1.txt saida1.txt


diff2:
	diff out2.txt saida2.txt


diff3:
	diff out3.txt saida3.txt


clean:
	rm -rf *.o


purge: clean
	rm -rf teste*