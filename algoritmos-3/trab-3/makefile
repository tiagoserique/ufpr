
CFLAGS = -Wall
DEBUG = -g

objects = main.o lib-arvb.o lib-arva.o

all: busca

busca: $(objects)
	gcc $(objects) -o busca $(LIBS)

main.o: main.c
	gcc -c main.c $(CFLAGS)

lib-arvb.o:	lib-arvb.c lib-arvb.h
	gcc -c lib-arvb.c $(CFLAGS)

lib-arva.o:	lib-arva.c lib-arva.h
	gcc -c lib-arva.c $(CFLAGS)

clean:
	rm -f *.o

purge:	clean
	rm -f busca

debug: $(objects)
	gcc $(objects) -o busca $(LIBS) $(DEBUG)