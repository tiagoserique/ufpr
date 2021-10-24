
CFLAGS = -Wall

LIBS = -lm -I/usr/include -L/usr/lib -lmatheval

objects = main.o newton.o utils.o 

all: $(objects)
	gcc $(CFLAGS) $(objects) -o newtonSNL $(LIBS)

main.o:
	gcc -c $(CFLAGS) main.c $(LIBS)

newton.o: newton.h
	gcc -c $(CFLAGS) newton.c $(LIBS)

utils.o: utils.h
	gcc -c $(CFLAGS) utils.c $(LIBS)

teste: 
	./newtonSNL < sample.in > saida.csv

clean: 
	rm $(objects)
	rm newtonSNL
