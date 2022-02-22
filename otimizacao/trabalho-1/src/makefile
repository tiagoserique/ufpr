
CFLAGS = -Wall 

OBJECTS = main.o utils.o


all: $(OBJECTS)
	cc $(OBJECTS) $(CFLAGS) -o executavel


main.o: main.c
	cc -c $(CFLAGS) main.c  


utils.o: utils.c utils.h
	cc -c $(CFLAGS) utils.c


clean:
	rm $(OBJECTS)


purge: clean
	rm executavel
