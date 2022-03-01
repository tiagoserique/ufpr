
CFLAGS = -Wall 
LIBS = -lm

objects = main.o knn.o read_data.o


all: $(objects)
	gcc $(CFLAGS) $(objects) -o knn $(LIBS)

main.o: main.c
	cc -c $(CFLAGS) main.c $(LIBS)

knn.o: knn.c knn.h
	cc -c $(CFLAGS) knn.c $(LIBS)

read_data.o: read_data.c read_data.h 
	cc -c $(CFLAGS) read_data.c $(LIBS)

clean:
	rm $(objects)

purge: clean
	rm knn