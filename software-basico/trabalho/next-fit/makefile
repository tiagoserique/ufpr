
FLAGS = -no-pie -static


all: avalia


avalia: avalia.c meuAlocador.s meuAlocador.h
	gcc -c avalia.c -g
	as meuAlocador.s -o meuAlocador.o -g
	gcc $(FLAGS) avalia.o meuAlocador.o -o avalia -g

clean:
	rm -rf *.o


purge: clean
	rm -rf avalia
