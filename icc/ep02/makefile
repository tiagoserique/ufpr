
DEDBUG = -g

CFLAGS = -Wall

LIBS = -lm -I/usr/include -L/usr/lib -lmatheval

objects = main.o gauss-seidel.o utils.o 

all: ep02

ep02: $(objects)
	gcc $(CFLAGS) $(objects) -o ep02 $(LIBS)

main.o: main.c
	gcc -c $(CFLAGS) main.c $(LIBS)

gauss-seidel.o: gauss-seidel.c gauss-seidel.h
	gcc -c $(CFLAGS) gauss-seidel.c $(LIBS)

utils.o: utils.c utils.h
	gcc -c $(CFLAGS) utils.c $(LIBS)

teste: 
	./ep02 < sample.in > sample.out

debug: $(objects)
	gcc $(CFLAGS) $(objects) $(DEBUG) $(LIBS)

clean: 
	rm $(objects)
	rm ep02
	rm sample.out