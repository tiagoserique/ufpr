CFLAGS = -Wall -std=c99
objects = queue.o testafila.o

all: $(objects)
	gcc -Wall $(objects) -o teste


testafila.o: testafila.c 
	gcc $(CFLAGS) -c testafila.c


queue.o: queue.c queue.h 
	gcc $(CFLAGS) -c queue.c


clean:
	rm -rf *.o


purge: clean
	rm -rf teste