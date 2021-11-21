CFLAGS = -Wall

LIBS = -lm -I/usr/include -L/usr/lib -lmatheval

objects = main.o newtonSNL.o utils.o jacobiana.o gauss.o entrada.o

all: newtonSNL

newtonSNL: $(objects)
	gcc $(CFLAGS) $(objects) -o newtonSNL $(LIBS)

main.o: main.c
	gcc -c $(CFLAGS) main.c $(LIBS)

entrada.o: entrada.c entrada.h
	gcc -c $(CFLAGS) entrada.c $(LIBS)

newtonSNL.o: newtonSNL.c newtonSNL.h
	gcc -c $(CFLAGS) newtonSNL.c $(LIBS)

utils.o: utils.c utils.h
	gcc -c $(CFLAGS) utils.c $(LIBS)

jacobiana.o: jacobiana.c jacobiana.h
	gcc -c $(CFLAGS) jacobiana.c $(LIBS)

gauss.o: gauss.c gauss.h
	gcc -c $(CFLAGS) gauss.c $(LIBS)

teste:
	./newtonSNL < examples/sistemas.dat -o saida.out

clean: 
	rm $(objects)
	rm newtonSNL