CFLAGS = -Wall -std=c99
objects = contexts.o

all: $(objects)
	gcc -Wall $(objects) -o teste


contexts.o: contexts.c 
	gcc $(CFLAGS) -c contexts.c


clean:
	rm -rf *.o


purge: clean
	rm -rf teste