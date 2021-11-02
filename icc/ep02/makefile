
CFLAGS = -Wall

LIBS = -lm -I/usr/include -L/usr/lib -lmatheval

objects = main.o gauss-seidel.o utils.o 

all: $(objects)
	gcc $(CFLAGS) $(objects) -o ep02 $(LIBS)

main.o:
	gcc -c $(CFLAGS) main.c $(LIBS)

gauss-seidel.o: gauss-seidel.h
	gcc -c $(CFLAGS) gauss-seidel.c $(LIBS)

utils.o: utils.h
	gcc -c $(CFLAGS) utils.c $(LIBS)

teste: 
	./ep02 < sample.in > saida.out

testa-saida:
	diff sample.in sample.out

clean: 
	rm $(objects)
	rm ep02
